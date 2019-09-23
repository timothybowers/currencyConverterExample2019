//
//  NetworkAPI.swift
//  TimothyCC
//
//  Created by Timothy on 19/8/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

typealias dataClosure = (Data) -> Void
typealias errorClosure = (HttpError) -> Void
typealias invalidClosure = (URLResponse) -> Void

protocol HttpClientProtocol {

    func method(type: HttpMethods) -> HttpClient
    
    func onResult(onSuccessData: dataClosure?, onError: errorClosure?)

}

class HttpClient: HttpClientProtocol {
    
    var urlRequest: URLRequest
    
    init(urlRequest _urlRequest: URLRequest) {
        self.urlRequest = _urlRequest
    }
    
}



