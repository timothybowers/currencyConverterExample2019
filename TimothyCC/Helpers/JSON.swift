//
//  JSON.swift
//  TimothyCC
//
//  Created by Timothy on 19/8/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

class JSON {
    
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
