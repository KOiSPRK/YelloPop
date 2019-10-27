//
//  Number.swift
//  APIService
//
//  Created by KOiSPRK on 10/27/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

public class Number: NSObject, Decodable {

    public var text:String?
    public var number:Int?
    public var found:Bool?
    public var type:String?
    
    public override init() {
        super.init()
    }
 
    private enum CodingKeys: String, CodingKey {
        case text
        case number
        case found
        case type
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
//        try super.init(from: decoder)
        self.text = try? container.decode(String.self, forKey: .text)
        self.number = try? container.decode(Int.self, forKey: .number)
        self.found = try? container.decode(Bool.self, forKey: .found)
        self.type = try? container.decode(String.self, forKey: .type)
    }
    
}
