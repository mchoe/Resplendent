//
//  ResplendentCommon.swift
//  Resplendent
//
//  Copyright (c) 2015 Michael Choe
//  http://www.straussmade.com/
//  http://www.twitter.com/_mchoe
//  http://www.github.com/mchoe
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//





import Foundation


protocol CanProvideResplendentColor {
    var asResplendentColor: ResplendentColor { get }
}


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



