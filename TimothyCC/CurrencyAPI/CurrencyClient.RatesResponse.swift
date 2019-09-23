//
//  RateDetails.swift
//  TimothyCC
//
//  Created by Timothy on 19/8/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

struct RatesResponse: Decodable {
    
    var buyNotes: String?
    var buyTC: String?
    var buyTT: String?
    var country: String?
    var currencyCode: String?
    var currencyName: String?
    var effectiveDateFmt: String?
    var lastUpdates: String?
    var sellNotes: String?
    var sellTT: String?
    var spotRateDateFmt: String?
    var updateDateFmt: String?
    
    enum CodingKeys: String, CodingKey {
        case buyNotes
        case buyTC
        case buyTT
        case country
        case currencyCode
        case currencyName
        case effectiveDateFmt = "effectiveDate_Fmt"
        case lastUpdates = "LASTUPDATED"
        case sellNotes
        case sellTT
        case spotRateDateFmt = "SportRate_Date_Fmt"
        case updateDateFmt = "updateDate_Fmt"
    }
    
}
