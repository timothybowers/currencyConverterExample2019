//
//  CurrencyRXAPI.swift
//  TimothyCC
//
//  Created by Timothy on 23/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation


class CurrencyRXAPI {
    
    var networkRX: NetworkRX?
    var products: [String]?

    init() {
        self.networkRX = NetworkRX()
        self.products = Constants().products
    }
    
    let currencyDataUrl = URL(string: "https://jsonapi.org/examples/")
    typealias fetchclosure = ([ProductRateDetails]?) -> Void
    
    func rxFetchCurrencyData(onComplete: fetchclosure?) {

        guard let products = self.products else {
            onComplete?(nil)
            return
        }

        var productRates: [ProductRateDetails] = []
        
        let url = self.currencyDataUrl
        
        let _ = self.networkRX?
            .fetchDataRX(url: url!)
        .subscribe(
            onNext:  { data in
                print("NEXT!")
                
                for product in products {
                    let path = "data.Brands.WBC.Portfolios.FX.Products.\(product).Rates.\(product)"
                    if let json = JSON.indexPath(data: data, path: path) {
                        
                        do {
                            let data = try JSONSerialization.data(withJSONObject: json, options: [.sortedKeys, .prettyPrinted])
                            let decoder = JSONDecoder()
                            let decoded = try decoder.decode(ProductRateDetails.self, from: data)
                            productRates.append(decoded)
                        }
                        catch {
                            print("(\(String(describing: url))) HttpError.decoding:\nDecoding error: \(error)")
                        }
                    }
                    
                }
                
                onComplete?(productRates)
                
                
            },
            onError: { error in
                print("ERROR!")
            }
        )
        

    }
    
}