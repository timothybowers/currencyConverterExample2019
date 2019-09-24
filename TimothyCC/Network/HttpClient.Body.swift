//
//  HttpClient.Body.swift
//  TimothyCC
//
//  Created by Timothy on 23/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

extension HttpClient {
    
    func body<T: Encodable>(_ bodyData: T) -> HttpClient {

        do {
            let httpBody = try JSONEncoder().encode(bodyData)

            urlRequest?.httpBody = httpBody
            urlRequest?.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

            
        } catch {

            
        }

        return self
    }
    
}
