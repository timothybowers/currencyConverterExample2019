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

    func onError(onErrorClosure _onErrorClosure: errorClosure?) -> HttpClient
    
    func url(url: String) -> HttpClient

    func method(type: HttpMethods) -> HttpClient
    
    func body<T: Encodable>(_ bodyData: T) -> HttpClient
    
    func dataDecoder<T: Decodable>(returnType:  T.Type, onSuccess: ((T) -> Void)?) -> HttpClient
    
    func startRequest()

}

class HttpClient: HttpClientProtocol {
   
    var urlRequest: URLRequest?
    var decodeClosure: dataClosure?
    var decoderClient: DecoderClientProtocol?
    var onError: errorClosure?
    
    init(decoderClient: DecoderClientProtocol) {
        self.decoderClient = decoderClient
    }
    
}


