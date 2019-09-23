//
//  CurrencyAPI.swift
//  TimothyCC
//
//  Created by Timothy on 19/8/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

class CurrencyAPI {
    
    var apiClient: APIClient?
    var products: [String]?

    init() {
        self.apiClient = APIClient()
        self.products = Constants().products
    }
    
    let currencyDataUrl = URL(string: "https://jsonapi.org/examples/")
    typealias fetchclosure = ([ProductRateDetails]?) -> Void
    
    func fetchCurrencyDataDelegates() {
        
        guard let url = self.currencyDataUrl else {
            return
        }
        
        let _ = apiClient?
            .url(url: url)
            .method(type: .GET)
            .onResult(
                onSuccess: { (data) in

            },
                onError: { (httpError) in

            }
        )
    }

}
