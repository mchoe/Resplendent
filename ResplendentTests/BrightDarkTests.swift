//
//  LightDarkTests.swift
//  Resplendent
//
//  Created by Michael Choe on 1/21/16.
//  Copyright © 2016 Strauss LLC. All rights reserved.
//

import XCTest

class BrightDarkTests: XCTestCase {

    func testBrightColor() {
        
        var testColor = UIColor.whiteColor()
        XCTAssertEqual(testColor.isBright(), true, "White should be a bright color")
        
        testColor = UIColor.yellowColor()
        XCTAssertEqual(testColor.isBright(), true, "Yellow should be a bright color")
    }
    
    func testDarkColor() {
        
        var testColor = UIColor.blackColor()
        XCTAssertEqual(testColor.isDark(), true, "Black should be a dark color")
        
        testColor = UIColor.brownColor()
        XCTAssertEqual(testColor.isDark(), true, "Brown should be a dark color")
    }

}
