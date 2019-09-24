//
//  HttpClient.DataDecoder.swift
//  TimothyCC
//
//  Created by Timothy on 24/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

extension HttpClient {
    
    func dataDecoder<T: Decodable>(returnType:  T.Type, onSuccess: ((T) -> Void)?) -> HttpClient {
        decodeClosure = { [weak self] data in
            if let fetchedProducts = self?.decoderClient?.data(data: data, returnType: returnType) {
                onSuccess?(fetchedProducts)
            }
        }
        return self
    }
    
}
