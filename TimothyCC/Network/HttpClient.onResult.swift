//
//  HttpClient.Result.swift
//  TimothyCC
//
//  Created by Timothy on 23/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

extension HttpClient {
    
    func onResult(onSuccess: dataClosure?, onError: errorClosure?) {
     
        let urlRequest = self.urlRequest
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in

            if let error = error {
                
                onError?(.error(error: error))
                
            } else {
                
                if let data = data {
                
                    onSuccess?(data)
                
                } else {
                    
                    if let urlResponse = urlResponse {

                        onError?(.invalidResponse(response: urlResponse))

                    } else {
                        
                        onError?(.nilResponse)
                        
                    }

                }
                
            }
            
        }
        task.resume()
        
    }
    
}
