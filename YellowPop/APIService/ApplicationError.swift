//
//  ApplicationError.swift
//  YellowPop
//
//  Created by KOiSPRK on 10/29/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

public enum ApplicationError: Error {
    
    case custom(message:String)
    case parsingError
    case unknowError
    case invalidUrl
    
    public var message:String {
        switch self {
        case .custom(let message):
            return self.printFormatedError(with: message)
            
        case .parsingError:
            return self.printFormatedError(with: "Parsing Error")
            
        case .unknowError:
            return self.printFormatedError(with: "Unknown Error")
            
        case .invalidUrl:
            return self.printFormatedError(with: "Invalid Url")
        }
    }
    
    // MARK: Private
    
    fileprivate func printFormatedError(with error:String) -> String {
        print("\n!! ERROR !!\n\(error)\n")
        return error
    }
}
