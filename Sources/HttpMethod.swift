//
//  HttpMethod.swift
//  eich
//
//  Created by mdelmaestro on 14/01/22.
//

// Reference https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods

public enum HttpMethod: String {
    case get = "GET"
    case head = "HEAD"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case connect = "CONNECT"
    case options = "OPTIONS"
    case trace = "TRACE"
    case patch = "PATCH"
}
