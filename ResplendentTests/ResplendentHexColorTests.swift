//
//  ResplendentTests.swift
//  ResplendentTests
//
//  Created by Michael Choe on 1/5/16.
//  Copyright © 2016 Strauss LLC. All rights reserved.
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
