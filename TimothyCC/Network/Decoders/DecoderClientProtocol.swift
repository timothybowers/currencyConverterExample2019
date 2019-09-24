//
//  DecoderClientProtocol.swift
//  TimothyCC
//
//  Created by Timothy on 24/9/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

protocol DecoderClientProtocol {
    
    func data<T: Decodable>(data: Data, returnType: T.Type) -> T?
    
}
