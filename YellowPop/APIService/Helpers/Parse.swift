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

}

extension Parse {
    
    static func parseJSONNumber(from data: Data?, completion: @escaping CompletionBlock) {
        do {
            guard let data = data, let json = try data.jsonObject(),
                let number = Parse.jsonGenericObject(with: json, type: Number.self) else {
                    completion(nil, ApplicationError.parsingError)
                    return
            }
            completion(number, nil)
            return

        } catch {
            if let data = data, let err = String(data: data, encoding: String.Encoding.utf8) {
                completion(nil, ApplicationError.custom(message: err))
                return
            }
        }
        completion(nil, ApplicationError.unknowError)
        return
    }
    
}
