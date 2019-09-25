//
//  ViewModel.swift
//  TimothyCC
//
//  Created by Timothy on 19/8/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

// MARK: - ViewModel example:

class ViewModel {

    // MARK: - Data
    
    var products: [String]?

    
    // MARK: - Dependencies
    
    var currencyClient: CurrencyClient?
    
    // MARK: - Initialisers
    
    init() {
        self.currencyClient = CurrencyClient()
        self.products = Constants().products
    }

    // MARK: - Closures
    
    typealias fetchCurrencyClosure = (RatesResponse?) -> Void

    
    // MARK: - API Methods
    
    func fetchCurrency(onComplete: fetchCurrencyClosure?) {
        
        // MARK: - Example of an API call:
        
        currencyClient?
            .currency(
                id: "12344324",
                onSuccess: { (decodedObject) in
                
                    print("call success")
                    
                    onComplete?(decodedObject)
                    
                    
            }, onError: { (httpError) in
                
                print("call error")
                
                onComplete?(nil)

                return
                
            })
  
    }

}
