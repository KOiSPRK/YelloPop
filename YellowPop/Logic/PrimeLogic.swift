//
//  PrimeLogic.swift
//  Logic
//
//  Created by KOiSPRK on 10/27/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import Foundation

public class PrimeLogic: NSObject {

    public static func isPrime(with value:UInt) -> Bool? {
        switch value {
            case 0, 1:  return false
            case 2, 3:  return true
            default:
                for i in 2...UInt(sqrt(Double(value))) {
                    if value % i == 0 {
                        return false
                    }
                }
                return true
            }
    }
    
}
