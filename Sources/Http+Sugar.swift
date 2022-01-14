//
//  Http+Sugar.swift
//  eich
//
//  Created by mdelmaestro on 14/01/22.
//

extension HttpClient {
    
    public func get(
        _ path: String,
        headers: [String : String] = [:],
        completion: @escaping ResponseCompletion
    ) {
        request(path, method: .get, headers: headers, completion: completion)
    }
    
    public func post(
        _ path: String,
        headers: [String : String] = [:],
        body: Data? = nil,
        completion: @escaping ResponseCompletion
    ) {
        request(path, method: .post, headers: headers, body: body, completion: completion)
    }
    
    public func put(
        _ path: String,
        headers: [String : String] = [:],
        body: Data? = nil,
        completion: @escaping ResponseCompletion
    ) {
        request(path, method: .put, headers: headers, body: body, completion: completion)
    }
    
    public func delete(
        _ path: String,
        headers: [String : String] = [:],
        completion: @escaping ResponseCompletion
    ) {
        request(path, method: .delete, headers: headers, completion: completion)
    }
}
