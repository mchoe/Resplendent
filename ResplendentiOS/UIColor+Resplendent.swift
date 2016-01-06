//
//  UIColor+Resplendent.swift
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






import UIKit

extension UIColor {
    
    public convenience init(r: Int, g: Int, b: Int, a: CGFloat? = nil) {
        
        let alphaValue: CGFloat
        if let alpha = a {
            alphaValue = alpha
        } else {
            alphaValue = 1.0
        }
        
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alphaValue)
    }
    
    
    public convenience init(hexString: String) {
        
        guard let hexColor = ResplendentHexColor(hexString: hexString) else {
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
            return
        }
        
        self.init(r: Int(hexColor.components.red), g: Int(hexColor.components.green), b: Int(hexColor.components.blue))
    }
    
}

extension UIColor: CanProvideResplendentColor {
    
    var asResplendentColor: ResplendentColor {
        get {
            
            var red: CGFloat = 0.0
            var green: CGFloat = 0.0
            var blue: CGFloat = 0.0
            var alpha: CGFloat = 0.0
            
            self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            return ResplendentColor(red: UInt(round(red * 255)), green: UInt(round(green * 255)), blue: UInt(round(blue * 255)))
            
        }
    }
    
}

extension UIColor {
    
    func asHexString() -> String {
        let components = self.asResplendentColor
        return "\(components.red.asHexString)\(components.green.asHexString)\(components.blue.asHexString)"
    }
    
}
