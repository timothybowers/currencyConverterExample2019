//
//  APIClient.swift
//  TimothyCC
//
//  Created by Timothy on 23/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

class APIClient {

    class func url(url: URL) -> HttpClientProtocol {
        return HttpClient(urlRequest: URLRequest(url: url))
    }
    
}
