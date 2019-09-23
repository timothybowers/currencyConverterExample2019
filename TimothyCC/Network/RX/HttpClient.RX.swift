//
//  NetworkRX.swift
//  TimothyCC
//
//  Created by Timothy on 23/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import RxSwift

class NetworkRX {

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
