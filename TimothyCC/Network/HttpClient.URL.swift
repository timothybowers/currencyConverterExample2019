//
//  HttpClient.URL.swift
//  TimothyCC
//
//  Created by Timothy on 24/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

extension HttpClient {
    
    func url(url: String) -> HttpClient {
        if let url = URL(string: url) {
            self.urlRequest = URLRequest(url: url)
        } else {
            assertionFailure("Invalid url string: \(url)")
        }
        return self
    }
    
}
