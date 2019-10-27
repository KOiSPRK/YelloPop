//
//  DataExtension.swift
//  APIService
//
//  Created by KOiSPRK on 10/27/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import Foundation

extension Data {
    
    func jsonObject(options: JSONSerialization.ReadingOptions = .allowFragments) throws -> [String: Any]? {
        return try JSONSerialization.jsonObject(with: self, options: options) as? [String: Any]
    }
    
}
