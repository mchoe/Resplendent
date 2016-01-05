//
//  String+Hex.swift
//  SwiftColorExtensions
//
//  Created by Michael Choe on 1/3/16.
//  Copyright © 2016 Strauss LLC. All rights reserved.
//

import Foundation



extension String {
    
    var hexStringAsUInt: UInt? {
        get {
            
            if self.isValidHexString == false {
                return nil
            }
            
            if let asInt = Int(self) where asInt == 0 {
                return 0
            }
            
            var value: UInt32 = 0
            let isValid = NSScanner(string: self).scanHexInt(&value)
            if isValid && value != 0 {
                return UInt(value)
            }
            return nil
        }
    }
    
    var isValidHexString: Bool {
        
        if self.rangeOfString("[^0-9a-fA-F]", options: .RegularExpressionSearch, range: nil, locale: nil) != nil {
            return false
        }
        
        return true
        
    }
    
}