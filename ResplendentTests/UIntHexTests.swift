//
//  UIntHexTests.swift
//  Resplendent
//
//  Created by Michael Choe on 1/5/16.
//  Copyright © 2016 Strauss LLC. All rights reserved.
//

import XCTest

class UIntHexTests: XCTestCase {
    
    func testUIntToHexStringConversion() {
        
        var testUInt: UInt = 0
        XCTAssertEqual(testUInt.asHexString, "00", "UInt to String not converting properly")
        
        testUInt = 255
        XCTAssertEqual(testUInt.asHexString, "FF", "UInt to String not converting properly")
        
        testUInt = 3000
        XCTAssertEqual(testUInt.asHexString, "BB8", "UInt to String not converting properly")
        
        testUInt = 4294967295
        XCTAssertEqual(testUInt.asHexString, "FFFFFFFF", "UInt to String not converting properly")
        
        
        // file:///Users/michaelchoe/Desktop/PROGRAMMING/OWN/iOS/Resplendent/ResplendentTests/UIntHexTests.swift: test failure: -[UIntHexTests testUIntToHexStringConversion()] failed: XCTAssertEqual failed: ("Optional("755E72EF")") is not equal to ("Optional("8562C755E72EF")") - UInt to String not converting properly

    }
    
}
