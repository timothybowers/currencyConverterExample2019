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
    
    func currency(onSuccess: dataClosure?, onError: errorClosure? ) {
        
        let parameters = "?id=1"
        let requestString = "\(baseURL)/api/v1\(parameters)"
        guard let url = URL(string: requestString) else {
            onError?(HttpError.nilRequest)
            return
        }
        
        let _ = APIClient.url(url: url).method(type: .GET).onResult(onSuccess: onSuccess, onError: onError)
    }
    
}
