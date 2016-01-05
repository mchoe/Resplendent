//
//  ResplendentTests.swift
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




import XCTest

class ResplendentHexColorTests: XCTestCase {
    
    func testHexLength() {
        
        XCTAssertNil(ResplendentHexColor(hexString: "#12345"), "Must make sure the input string is the correct length")
    }
    
    func testColorConversion() {
        
        guard let testHex = ResplendentHexColor(hexString: "#ab65E1") else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(testHex.components.red, 171, "Red is not converting correctly")
        XCTAssertEqual(testHex.components.green, 101, "Green is not converting correctly")
        XCTAssertEqual(testHex.components.blue, 225, "Blue is not converting correctly")
        
    }
    
    
    
}
