//
//  APIService.swift
//  APIService
//
//  Created by KOiSPRK on 10/27/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import Foundation

public class APIService: NSObject {

    public static func getNumberInfo(with value:UInt, completion: @escaping (Number, Error?) -> ()) {
        let fullURL:String = "http://numbersapi.com/\(value)?json"

        guard let url = URL(string: fullURL) else {
            return
        }
        print(url.absoluteString)
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data, let result = Parse.parseJSON(from: data) else {
                return
            }
            return completion(result, error)
        }
        task.resume()
        return
    }
    
}
