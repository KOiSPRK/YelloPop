//
//  History.swift
//  YellowPop
//
//  Created by KOiSPRK on 10/27/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

struct History {

    var desc:String?
    var number:UInt?
    
    init(with number:UInt, desc:String) {
//        super.init()
        self.number = number
        self.desc = desc
    }
    
}
