//
//  StringHexTests.swift
//  Resplendent
//
//  Created by Michael Choe on 1/5/16.
//  Copyright © 2016 Strauss LLC. All rights reserved.
//

import XCTest

class StringHexTests: XCTestCase {
    
    func testStringHexValidity() {
        
        // Test for invalid hex characters
        
        var testString = "634acbf239gggbde12"
        XCTAssertFalse(testString.isValidHexString, "Invalid hex characters should not be allowed")
        
        testString = "876de234fabc"
        XCTAssertTrue(testString.isValidHexString, "Valid hex characters should be allowed")
        
        testString = "02 0b 6d 30 aa c1 05 52 6d 0b"
        XCTAssertFalse(testString.isValidHexString, "Whitespace should not be allowed")
        
    }
    
    func testHexStringConversion() {
        
        let testString = "a6f2beef"
        XCTAssertEqual(testString.hexStringAsUInt, 2800926447, "Hex string to Int conversion not working properly")
        
    }
    
}
