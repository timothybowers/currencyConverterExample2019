//
//  CurrencyClient.swift
//  TimothyCC
//
//  Created by Timothy on 23/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

class CurrencyClient {
    
    let baseURL = "https://localhost"
    
    func currency(onSuccess: ((RatesResponse) -> Void)?, onError: errorClosure? ) {
        
        // MARK: - Path
        let parameters = "?id=1"
        let requestString = "\(baseURL)/api/v1\(parameters)"

        guard let url = URL(string: requestString) else {
            onError?(HttpError.invalidURL)
            return
        }
        
        // MARK: - Request Body
        let requestBody = RatesRequest(id: "1234213")
        
        // MARK: - Decoder
        let successData: dataClosure = { data in
            if let fetchedProducts: RatesResponse = JSON.data(data: data, returnType: RatesResponse.self) {
                onSuccess?(fetchedProducts)
            }
        }
        
        // MARK: - Start network request
        APIClient
            .url(url: url)
            .method(type: .GET)
            .body(requestBody)
            //.headerAuthToken
            .onResult(onSuccessData: successData, onError: onError)
    }

    
    
    
}


