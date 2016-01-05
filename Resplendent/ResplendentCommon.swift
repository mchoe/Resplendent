//
//  SwiftColorExtensionsCommon.swift
//  SwiftColorExtensions
//
//  Created by Michael Choe on 12/31/15.
//  Copyright © 2015 Strauss LLC. All rights reserved.
//

import Foundation


struct ResplendentColor {
    let red: UInt
    let green: UInt
    let blue: UInt
}

extension ResplendentColor {
    
    static func defaultErrorColor() -> ResplendentColor {
        return ResplendentColor(red: 181, green: 226, blue: 75)
    }
    
}


struct ResplendentHexColor {
    
    let components: ResplendentColor
    let alpha: Float
    
    init?(hexString: String) {
        
        let truncatedHexString: String
        
        if hexString.hasPrefix("#") {
            truncatedHexString = hexString.substringFromIndex(hexString.startIndex.advancedBy(1))
        } else {
            truncatedHexString = hexString
        }
        
        let hexStringCount = truncatedHexString.characters.count
        
        switch hexStringCount {
        case 6:
            guard let asUInt = truncatedHexString.hexStringAsUInt else {
                return nil
            }
            
            self.components = ResplendentColor(red: (asUInt >> 16) & 0xFF, green: (asUInt >> 8) & 0xFF, blue: asUInt & 0xFF)
            self.alpha = 1.0
            
            break
        default:
            return nil
        }
        
    }
    
}



