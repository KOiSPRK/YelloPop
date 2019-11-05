//
//  LogicTests.swift
//  LogicTests
//
//  Created by KOiSPRK on 10/26/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import XCTest
@testable import Logic

class LogicTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPrimeLogic() {
        let value:Int = 20
        
        for i in 2..<value {
            XCTAssertEqual(isPrime(with: i), optimizedPrime(with: i))
        }
        
        XCTAssertTrue(value > 1, "Prime Number must be greater than 1")
        XCTAssertEqual(isPrime(with: value), optimizedPrime(with: value))
    }
    
    func isPrime(with value:Int) -> Bool {
        guard value > 1 else {
            return false
        }
        for i in 2..<value {
            if value % i == 0 {
                return false
            }
        }
        return true
    }
    
    func optimizedPrime(with value:Int) -> Bool {
        switch value {
        case 0, 1:  return false
        case 2, 3:  return true
        default:
            for i in 2...(value/2) {
                if value % i == 0 {
                    return false
                }
            }
            return true
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
