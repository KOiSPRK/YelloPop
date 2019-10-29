//
//  History.swift
//  YellowPop
//
//  Created by KOiSPRK on 10/27/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

class History: NSObject {

    var desc:String?
    var number:UInt?
    
    init(with number:UInt, desc:String) {
        self.number = number
        self.desc = desc
    }
    
}
