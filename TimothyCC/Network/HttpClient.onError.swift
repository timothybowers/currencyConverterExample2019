//
//  HttpClient.onError.swift
//  TimothyCC
//
//  Created by Timothy on 24/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

extension HttpClient {
    
    func onError(onErrorClosure _onErrorClosure: errorClosure?) -> HttpClient {
        self.onError = _onErrorClosure
        return self
    }
    
}
