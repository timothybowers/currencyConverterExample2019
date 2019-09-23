//
//  JSONHelper.swift
//  TimothyCC
//
//  Created by Timothy on 19/8/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

class JSONHelper {
    
    class func prettyPrint(data: Data, request: URLRequest) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            let data = try JSONSerialization.data(withJSONObject: json, options: [.sortedKeys, .prettyPrinted])
            
            if let prettySwiftString = String(data: data, encoding: .utf8) {
                print("\n\(RequestHelper.convertURLRequestToCurlCommand(request))")
                print("\n\(prettySwiftString)")
            }
            
        } catch {
            print("prettyPrint: Could not deserialise data to json")
            if let returnData = String(data: data, encoding: .utf8) {
                print("prettyPrint: converting to readable string: \n\(returnData)")
            }
        }
    }
    
    class func indexPath(data: Data?, path: String?) -> Any? {
        guard let data = data else {
            return nil
        }
        guard let path = path else {
            return nil
        }
        do {
            if let jsonDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                return (jsonDict as NSDictionary).value(forKeyPath: path)
                
            }
            
        } catch {
            print("JSON decoding dictionary error: \(error)")
            return nil
        }
        
        return nil
    }

}
