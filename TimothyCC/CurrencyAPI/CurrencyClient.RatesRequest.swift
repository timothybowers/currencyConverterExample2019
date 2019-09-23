//
//  CurrencyClient.RatesRequest.swift
//  TimothyCC
//
//  Created by Timothy on 23/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

struct RatesRequest {
    
    var id: String
    
    enum CodingKeys: String, CodingKey {
        case id = "identifier"
    }
    
}
