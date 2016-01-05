//
//  UIColorTests.swift
//  Resplendent
//
//  Created by Michael Choe on 1/5/16.
//  Copyright © 2016 Strauss LLC. All rights reserved.
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
    
}
