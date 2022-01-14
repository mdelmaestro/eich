//
//  HttpResponse.swift
//  eich
//
//  Created by mdelmaestro on 14/01/22.
//

public struct HttpResponse {
    
    public let request: HttpRequest
    
    public let status: Int
    
    public let headers: [String : String]
    
    public let body: Data?
    
    public init(request: HttpRequest, data: Data?, httpURLResponse: HTTPURLResponse) {
        self.request = request
        self.status = httpURLResponse.statusCode
        self.headers = httpURLResponse.allHeaderFields as! [String : String] // safe to do
        self.body = data
    }
    
}
