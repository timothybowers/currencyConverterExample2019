//
//  CurrencyClient.swift
//  TimothyCC
//
//  Created by Timothy on 23/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation



// MARK: - Public facing interface

protocol CurrencyClientProtocol {
    
    func currency(id: String, onSuccess: ((RatesResponse) -> Void)?, onError: errorClosure?)
    
}



// MARK: - All API Calls for a category in this Class

class CurrencyClient: CurrencyClientProtocol {


    // MARK: - DEPENDENCIES
    
    var httpClient: HttpClientProtocol?
    
    init() {
        self.httpClient = HttpClient(decoderClient: JSONDecoderClient())
    }
    
    
    // MARK: - BASE URL
    
    let baseURL = "https://localhost"
    
    
    // MARK: - API CALL
    
    func currency(id: String, onSuccess: ((RatesResponse) -> Void)?, onError: errorClosure?) {
        
        // MARK: - Parameters
        let parameters = "?id=\(id)"

        // MARK: - Path
        let url = "\(baseURL)/api/v1\(parameters)"

        // MARK: - Request Body
        let requestBody = RatesRequest(id: "1234213")
        
        // MARK: - Start network request
        httpClient?
            .onError(onErrorClosure: onError)
            .url(url: url)
            .method(type: .GET)
            .body(requestBody)
            //.headerAuthToken
            .dataDecoder(returnType: RatesResponse.self, onSuccess: onSuccess)
            .startRequest()
    }

}

