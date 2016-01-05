//
//  String+Hex.swift
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