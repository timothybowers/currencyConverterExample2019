//
//  HttpClient.Errors.swift
//  TimothyCC
//
//  Created by Timothy on 23/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

enum HttpError {
    
    case error(error: Error)
    case invalidResponse(response: URLResponse)
    case nilResponse
    case nilRequest

}
