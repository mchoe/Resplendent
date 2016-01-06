//
//  UIColorTests.swift
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

class UIColorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUIColorInitialization() {
        
        let testColor = UIColor(hexString: "#bba528")
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        testColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        XCTAssertEqualWithAccuracy(red, CGFloat(0.73333333), accuracy: CGFloat(FLT_EPSILON), "Red is not converting correctly")
        XCTAssertEqualWithAccuracy(green, CGFloat(0.64705882), accuracy: CGFloat(FLT_EPSILON), "Green is not converting correctly")
        XCTAssertEqualWithAccuracy(blue, CGFloat(0.15686275), accuracy: CGFloat(FLT_EPSILON), "Blue is not converting correctly")
        
    }
    
    func testUIColorToResplendentColorConversion() {
        
        var testColor = UIColor.redColor()
        var components = testColor.asResplendentColor
        
        XCTAssertEqual(components.red, 255, "Red value should be 255")
        XCTAssertEqual(components.green, 0, "Red value should be 0")
        XCTAssertEqual(components.blue, 0, "Red value should be 0")
        
        testColor = UIColor.purpleColor()
        components = testColor.asResplendentColor
        
        XCTAssertEqual(components.red, 128, "Red value should be 128")
        XCTAssertEqual(components.green, 0, "Red value should be 0")
        XCTAssertEqual(components.blue, 128, "Red value should be 128")
        
    }
    
    func testUIColorToHexStringConversion() {
        
        var testColor = UIColor.cyanColor()
        XCTAssertEqual(testColor.asHexString(), "00FFFF", "UIColor to hex string conversion not working correctly")
        
        testColor = UIColor.brownColor()
        XCTAssertEqual(testColor.asHexString(), "996633", "UIColor to hex string conversion not working correctly")
        
    }
    
    func testConversionParity() {
        
        let testHex = "AC98B2"
        let hexColor = UIColor(hexString: testHex)
        XCTAssertEqual(hexColor.asHexString(), testHex, "Color conversions don't match each other")
        
    }
    
}
