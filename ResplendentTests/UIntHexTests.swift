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
        
        let testUInt: UInt = 2346548761359087
        XCTAssertEqual(testUInt.asHexString, "8562C755E72EF", "UInt to String not converting properly")
        
    }
    
}
