//
//  Parse.swift
//  APIService
//
//  Created by KOiSPRK on 10/27/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import Foundation

struct Parse {
    
    static func jsonGenericObject<T: Decodable>(with responses:[String:Any], type: T.Type) -> T? {
        guard let jsonData = try? responses.data(),
            let result = try? JSONDecoder().decode(T.self, from: jsonData) else {
                return nil
        }
        return result
    }
    
    static func parseJSON(from data: Data) -> Number? {
        do {
            guard let json = try data.jsonObject(),
                let number = Parse.jsonGenericObject(with: json, type: Number.self) else {
                return Number()
            }
            return number

        } catch {
            print("Couldn't parse JSON: \(error)")
            if let utf8String = String(data: data, encoding: String.Encoding.utf8) {
                print("Received: \(utf8String)")
            }
        }

        return nil
    }
}
