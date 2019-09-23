//
//  JSON.swift
//  TimothyCC
//
//  Created by Timothy on 23/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

class JSON {
    
    class func data<T: Decodable>(data: Data, returnType: T.Type) -> T? {

        let decoder = JSONDecoder()
        
        do {
            let decoded = try decoder.decode(returnType, from: data)
            return decoded
            
        } catch {
            
        }
        
        
        
        return nil
    }
    
    
}
