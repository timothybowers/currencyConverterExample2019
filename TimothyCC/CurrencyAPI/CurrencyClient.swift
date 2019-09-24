//
//  CurrencyClient.swift
//  TimothyCC
//
//  Created by Timothy on 23/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

protocol CurrencyClientProtocol {
    
    func currency(onSuccess: ((RatesResponse) -> Void)?, onError: errorClosure?)
    
}

class CurrencyClient: CurrencyClientProtocol {
    
    var httpClient: HttpClientProtocol?
    
    init() {
        self.httpClient = HttpClient(decoderClient: JSONDecoderClient())
    }
    
    let baseURL = "https://localhost"
    
    func currency(onSuccess: ((RatesResponse) -> Void)?, onError: errorClosure?) {
        
        // MARK: - Parameters
        let parameters = "?id=1"

        // MARK: - Path
        let url = "\(baseURL)/api/v1\(parameters)"

        // MARK: - Request Body
        let requestBody = RatesRequest(id: "1234213")
        
        // MARK: - Start network request
        httpClient?
            .onError(onError: onError)
            .url(url: url)
            .method(type: .GET)
            .body(requestBody)
            //.headerAuthToken
            .dataDecoder(returnType: RatesResponse.self, onSuccess: onSuccess)
            .startRequest()
    }

}

