//
//  ViewModel.swift
//  TimothyCC
//
//  Created by Timothy on 19/8/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

class ViewModel {
    
    var currencyClient: CurrencyClient?
    var products: [String]?

    init() {
        self.currencyClient = CurrencyClient()
        self.products = Constants().products
    }
    
    typealias fetchclosure = ([RatesResponse]?) -> Void
    
    func fetchCurrencyDataDelegates(onComplete: ((RatesResponse?) -> Void)?) {
        
        currencyClient?
            .currency(onSuccess: { (decodedObject) in
                
                onComplete?(decodedObject)
                        
            }, onError: { (httpError) in
                
                onComplete?(nil)
                return
                
            })
  
    }

}
