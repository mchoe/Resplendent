//
//  NSColor+Resplendent.swift
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





import Cocoa



extension NSColor {
    
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
        
        guard let hexColor = HexColor(hexString: hexString) else {
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
            return
        }
        
        self.init(r: Int(hexColor.rgb.red), g: Int(hexColor.rgb.green), b: Int(hexColor.rgb.blue))
    }
    
}

