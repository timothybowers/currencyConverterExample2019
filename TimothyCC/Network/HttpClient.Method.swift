//
//  HttpClient.Method.swift
//  TimothyCC
//
//  Created by Timothy on 23/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

enum HttpMethods: String {

    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
    
}

extension HttpClient {
    
    func method(type: HttpMethods) -> HttpClient {
        urlRequest.httpMethod = type.rawValue
        return self
    }
    
}
