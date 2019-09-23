//
//  RequestHelper.swift
//  TimothyCC
//
//  Created by Timothy on 23/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

class RequestHelper {
    
    private class func escapeTerminalString(_ value: String) -> String {
        return value.replacingOccurrences(of: "\"", with: "\\\"", options: [], range: nil)
    }
    
    class func convertURLRequestToCurlCommand(_ request: URLRequest) -> String {
        let method = request.httpMethod ?? "GET"
        var returnValue = "curl -X \(method) "
        
        if let httpBody = request.httpBody, request.httpMethod == "POST" {
            let maybeBody = String(data: httpBody, encoding: String.Encoding.utf8)
            if let body = maybeBody {
                returnValue += "-d \"\(escapeTerminalString(body))\" "
            }
        }
        
        for (key, value) in request.allHTTPHeaderFields ?? [:] {
            let escapedKey = escapeTerminalString(key as String)
            let escapedValue = escapeTerminalString(value as String)
            returnValue += "\n    -H \"\(escapedKey): \(escapedValue)\" "
        }
        
        let URLString = request.url?.absoluteString ?? "<unknown url>"
        
        returnValue += "\n\"\(escapeTerminalString(URLString))\""
        
        returnValue += " -i -v"
        
        return returnValue
    }
    
}
