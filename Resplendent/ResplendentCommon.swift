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







#if os(iOS)
import UIKit
#elseif os(OSX)
import Cocoa
#endif


protocol CanProvideResplendentColor {
    var asResplendentColor: ResplendentColor { get }
}

protocol HasAlpha {
    var alpha: CGFloat { get }
}

extension CanProvideResplendentColor {
    
    func asHexString() -> String {
        let components = self.asResplendentColor
        return "\(UInt(components.red).asHexString)\(UInt(components.green).asHexString)\(UInt(components.blue).asHexString)"
    }
    
}

extension CanProvideResplendentColor {
    
    // These values are from here:
    // https://www.w3.org/TR/AERT#color-contrast
    // 
    // Good SO Question covering this:
    // http://stackoverflow.com/questions/596216/formula-to-determine-brightness-of-rgb-color
    
    var perceivedLuminance: Double {
        get {
            let resplendentColor = self.asResplendentColor
            return (0.299 * Double(resplendentColor.red) + 0.587 * Double(resplendentColor.green) + 0.114 * Double(resplendentColor.blue)) / 255.0
        }
    }
    
}

extension CanProvideResplendentColor {
    
    func isDark() -> Bool {
        return self.perceivedLuminance < 0.5
    }
    
    func isBright() -> Bool {
        return !self.isDark()
    }
    
}


struct ResplendentColor {
    let red: Int
    let green: Int
    let blue: Int
}

extension ResplendentColor {
    
    init(rCGFloat: CGFloat, gCGFloat: CGFloat, bCGFloat: CGFloat) {
        self.red = Int(round(rCGFloat * 255))
        self.green = Int(round(gCGFloat * 255))
        self.blue = Int(round(bCGFloat * 255))
    }
    
}

extension ResplendentColor {
    
    static func defaultErrorColor() -> ResplendentColor {
        return ResplendentColor(red: 181, green: 226, blue: 75)
    }
    
}

extension ResplendentColor {
    
    static func randomColor() -> ResplendentColor {
        return ResplendentColor(red: Int(arc4random_uniform(256)), green: Int(arc4random_uniform(256)), blue: Int(arc4random_uniform(256)))
    }
    
}




struct ResplendentHexColor: HasAlpha {
    
    let components: ResplendentColor
    let alpha: CGFloat
    
    init?(hexString: String) {
        
        let truncatedHexString: String
        
        if hexString.hasPrefix("#") {
            truncatedHexString = hexString.substring(from: hexString.characters.index(hexString.startIndex, offsetBy: 1))
        } else {
            truncatedHexString = hexString
        }
        
        let hexStringCount = truncatedHexString.characters.count
        
        switch hexStringCount {
        case 6:
            guard let asUInt = truncatedHexString.hexStringAsUInt else {
                return nil
            }
            
            let asInt = Int(asUInt)
            
            self.components = ResplendentColor(red: (asInt >> 16) & 0xFF, green: (asInt >> 8) & 0xFF, blue: asInt & 0xFF)
            self.alpha = 1.0
            
            break
        default:
            return nil
        }
        
    }
    
}



