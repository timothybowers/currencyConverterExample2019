//
//  CurrencyAPI.swift
//  TimothyCC
//
//  Created by Timothy on 19/8/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

class CurrencyAPI {
    
    var networkService: NetworkAPI?
    var products: [String]?

    init() {
        networkService = NetworkAPI()
        products = Constants().products
    }
    
    let currencyDataUrl = URL(string: "https://jsonapi.org/examples/")
    typealias fetchclosure = ([ProductRateDetails]?) -> Void
    
    func fetchCurrencyData(onComplete: fetchclosure?) {

        guard let products = self.products else {
            onComplete?(nil)
            return
        }

        var productRates: [ProductRateDetails] = []
        
        let url = self.currencyDataUrl
        
        let _ = self.networkService?
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
