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
            .currency(onSuccess: { (data) in
                
                if let fetchedProducts: RatesResponse = JSON.data(data: data, returnType: RatesResponse.self) {

                    onComplete?(fetchedProducts)
                    return

                } else {

                    onComplete?(nil)
                    return

                }
                
            }, onError: { (httpError) in
                
                onComplete?(nil)
                return
                
            })
  
    }

}
