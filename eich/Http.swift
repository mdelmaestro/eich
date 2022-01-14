//
//  Http.swift
//  eich
//
//  Created by mdelmaestro on 14/01/22.
//

import Foundation

public typealias ResponseCompletion = (Result<HttpResponse, Error>) -> Void

public final class HttpClient {
    
    public let baseURL: String
    
    private let session: URLSession = .init(configuration: .default)
    
    public init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    public func request(
        _ path: String,
        method: HttpMethod = .get,
        headers: [String : String] = [:],
        body: Data? = nil,
        completion: @escaping ResponseCompletion
    ) {
        
        guard let base = URL(string: baseURL) else {
            completion(.failure(HttpError.malformedURL))
            return
        }
        
        guard let endpoint = URL(string: path, relativeTo: base) else {
            completion(.failure(HttpError.malformedURL))
            return
        }
        
        let request = HttpRequest(
            url: endpoint.absoluteString,
            method: method,
            headers: headers,
            body: body
        )
        
        execute(request, completion: completion)
    }
    
    func execute(_ request: HttpRequest, completion: @escaping ResponseCompletion) {
        
        var urlRequest = URLRequest(url: URL(string: request.url)!) // safe to do
        urlRequest.httpMethod = request.method.rawValue
        
        if request.headers.count > 0 {
            request.headers.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        }
        
        if let body = request.body {
            urlRequest.httpBody = body
        }
        
        let task = session.dataTask(with: urlRequest) { data, urlResponse, error in
            
            guard error == nil else {
                completion(.failure(error!)) // safe to do
                return
            }
            
            let response = HttpResponse(
                request: request,
                data: data,
                httpURLResponse: urlResponse as! HTTPURLResponse // safe to do
            )
            
            completion(.success(response))
        }
        
        task.resume()
    }
}
