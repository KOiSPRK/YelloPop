//
//  PrimeLogic.swift
//  Logic
//
//  Created by KOiSPRK on 10/27/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import Foundation

public class PrimeLogic: NSObject {

    public static func isPrime(with value:Int) -> Bool? {
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
    
}
