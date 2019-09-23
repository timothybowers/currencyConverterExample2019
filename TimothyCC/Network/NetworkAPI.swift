//
//  NetworkAPI.swift
//  TimothyCC
//
//  Created by Timothy on 19/8/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation
import RxSwift

typealias HttpDataCompletionClosure = ((Data?) -> Void)

class NetworkAPI {
   
    func fetchData(url: URL?, onCompletion: HttpDataCompletionClosure?) {
        guard let url = url else {
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            onCompletion?(data)
        }
        task.resume()
    }
    
    func fetchDataRX(url: URL) -> Observable<Data?> {

        let urlRequest = URLRequest(url: url)
        
        return Observable.create { observer in
            
            let task = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
                
                if let error = error {

                    observer.onError(error)
                    
                } else {

                    observer.onNext(data)

                }
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }

    }
    
}
