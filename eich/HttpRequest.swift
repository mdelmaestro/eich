//
//  HttpRequest.swift
//  eich
//
//  Created by mdelmaestro on 14/01/22.
//

public struct HttpRequest {
    
    public var url: String
    
    public var method: HttpMethod
    
    public var headers: [String : String]
    
    public var body: Data?
    
    public init(
        url: String,
        method: HttpMethod = .get,
        headers: [String : String] = [:],
        body: Data? = nil
    ) {
        self.url = url
        self.method = method
        self.headers = headers
        self.body = body
    }
}
