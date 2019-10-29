//
//  ViewModel.swift
//  YellowPop
//
//  Created by KOiSPRK on 10/27/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit
import APIService

class ViewModel: NSObject {

    var history:[History] = []
    
    override init() {
        super.init()
    }

    func append(with value:UInt, isPrime:Bool) {
        let desc = "\(value) is \(isPrime ? "" : "Not ")Prime"
        self.history.append(History(with: value, desc: desc))
    }
    
    func getNumberInfo(with value:UInt, completion: @escaping CompletionBlock) {
        APIService.getNumberInfo(with: value) { (number, error) in
            completion(number, error)
        }
    }
}
