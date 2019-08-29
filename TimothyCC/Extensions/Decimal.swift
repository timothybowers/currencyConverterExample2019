//
//  Decimal.swift
//  TimothyCC
//
//  Created by Timothy on 29/8/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

extension Decimal {
    
    mutating func round(_ scale: Int, _ roundingMode: NSDecimalNumber.RoundingMode) {
        var localCopy = self
        NSDecimalRound(&self, &localCopy, scale, roundingMode)
    }
    
    func rounded(_ scale: Int, _ roundingMode: NSDecimalNumber.RoundingMode) -> Decimal {
        var result = Decimal()
        var localCopy = self
        NSDecimalRound(&result, &localCopy, scale, roundingMode)
        return result
    }
 
    func stringValue() -> String {
        return NSDecimalNumber(decimal: self).stringValue
    }
    
}
