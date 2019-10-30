//
//  APIService.swift
//  APIService
//
//  Created by KOiSPRK on 10/27/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import Foundation

public typealias CompletionBlock = (Number?, ApplicationError?) -> ()

public class APIService: NSObject {

    public static func getNumberInfo(with value:Int, completion: @escaping CompletionBlock) {
        let fullURL:String = "http://numbersapi.com/\(value)?json"

        guard let url = URL(string: fullURL) else {
            completion(nil, ApplicationError.invalidUrl)
            return
        }
        print(url.absoluteString)
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            Parse.parseJSONNumber(from: data) { (number, error) in
                guard error == nil else {
                    completion(nil, error)
                    return
                }
                completion(number, nil)
            }
        }
        task.resume()
        return
    }
    
}
