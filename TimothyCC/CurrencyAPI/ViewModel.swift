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
