//
//  UInt+Hex.swift
//  Resplendent
//
//  Created by Michael Choe on 1/5/16.
//  Copyright © 2016 Strauss LLC. All rights reserved.
//

import Foundation


extension UInt {
    
    var asHexString: String {
        get {
            return String(format: "%02X", self)
        }
    }
    
}