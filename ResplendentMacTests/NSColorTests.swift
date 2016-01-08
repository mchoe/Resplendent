//
//  NSColorTests.swift
//  Resplendent
//
//  Created by Michael Choe on 1/7/16.
//  Copyright © 2016 Strauss LLC. All rights reserved.
//

import XCTest

class NSColorTests: XCTestCase {

    func testNSColorInitialization() {
        
        let testColor = NSColor(hexString: "#bba528")
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        testColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        XCTAssertEqualWithAccuracy(red, CGFloat(0.73333333), accuracy: CGFloat(FLT_EPSILON), "Red is not converting correctly")
        XCTAssertEqualWithAccuracy(green, CGFloat(0.64705882), accuracy: CGFloat(FLT_EPSILON), "Green is not converting correctly")
        XCTAssertEqualWithAccuracy(blue, CGFloat(0.15686275), accuracy: CGFloat(FLT_EPSILON), "Blue is not converting correctly")
        
    }
    
    func testNSColorToResplendentColorConversion() {
        
        var testColor = NSColor.redColor()
        var components = testColor.asResplendentColor
        
        XCTAssertEqual(components.red, 255, "Red value should be 255")
        XCTAssertEqual(components.green, 0, "Red value should be 0")
        XCTAssertEqual(components.blue, 0, "Red value should be 0")
        
        testColor = NSColor.purpleColor()
        components = testColor.asResplendentColor
        
        XCTAssertEqual(components.red, 128, "Red value should be 128")
        XCTAssertEqual(components.green, 0, "Red value should be 0")
        XCTAssertEqual(components.blue, 128, "Red value should be 128")
        
    }
    
    func testNSColorToHexStringConversion() {
        
        var testColor = NSColor.cyanColor()
        XCTAssertEqual(testColor.asHexString(), "00FFFF", "UIColor to hex string conversion not working correctly")
        
        testColor = NSColor.brownColor()
        XCTAssertEqual(testColor.asHexString(), "996633", "UIColor to hex string conversion not working correctly")
        
    }
    
    func testConversionParity() {
        
        let testHex = "AC98B2"
        let hexColor = NSColor(hexString: testHex)
        XCTAssertEqual(hexColor.asHexString(), testHex, "Color conversions don't match each other")
        
    }

}
