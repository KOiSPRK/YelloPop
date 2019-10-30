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
    
    func getHistoryTotal() -> Int {
        return self.history.count > Constant.maxHistory ? Constant.maxHistory : self.history.count
    }
    
    func getHistory() -> [History] {
        guard self.history.count > Constant.maxHistory else {
            return self.history
        }
        let k = self.history.suffix(from: self.history.count - Constant.maxHistory)
        return Array(k)
    }

    func append(with value:Int, isPrime:Bool) {
        let desc = "\(value) is \(isPrime ? "" : "Not ")Prime"
        let history = History(with: value, desc: desc)
        self.history.insert(history, at: self.history.count)
    }
    
}

extension ViewModel {
    
    // MARK: API
    
    func getNumberInfo(with value:Int, completion: @escaping CompletionBlock) {
        APIService.getNumberInfo(with: value) { (number, error) in
            completion(number, error)
        }
    }
    
}
