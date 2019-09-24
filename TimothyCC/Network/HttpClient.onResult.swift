//
//  HttpClient.Result.swift
//  TimothyCC
//
//  Created by Timothy on 23/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

extension HttpClient {
    
    func startRequest() {
     
        guard let urlRequest = urlRequest else {
            onError?(HttpError.invalidURL)
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, urlResponse, error) in

            if let error = error {
                
                self?.onError?(.error(error: error))
                
            } else {
                
                if let data = data {
                
                    self?.decodeClosure?(data)
                
                } else {
                    
                    if let urlResponse = urlResponse {

                        self?.onError?(.invalidResponse(response: urlResponse))

                    } else {
                        
                        self?.onError?(.nilResponse)
                        
                    }

                }
                
            }
            
        }
        task.resume()
        
    }
    
}
