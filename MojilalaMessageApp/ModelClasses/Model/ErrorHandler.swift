//
//  ErrorHandler.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 24/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit


enum ErrorHandler: Error {
    case jsonParseError(modelMame: String, propertyName: String)
    case jsonError
    case urlError(urlStr: String)
    case httpResponseError
    case httpResponseStatusCodeError(statusCode: Int)
}

extension ErrorHandler {
    
    func errorDescription() {
        switch self {
        case .jsonParseError(let modelName, let propertyName):
            debugPrint( "⚠️⚠️⚠️⚠️⚠️⚠️ \(modelName) ----> \(propertyName) not casting ------> ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️")
            break
        case .jsonError:
            debugPrint("⚠️⚠️⚠️⚠️⚠️⚠️ JSON Serilization Error not casting ------> ⚠️⚠️⚠️⚠️⚠️⚠️⚠️")
            break
        case .urlError(let urlStr):
            debugPrint( "⚠️⚠️⚠️⚠️⚠️ \(urlStr) URL Error------> at \(#file): \(#line) ⚠️⚠️⚠️⚠️⚠️⚠️⚠️")
            break
        case .httpResponseError:
            debugPrint( "⚠️⚠️⚠️⚠️⚠️ HTTP Response Error ------> \(#file): \(#line) ⚠️⚠️⚠️⚠️⚠️⚠️⚠️")
            break
        case .httpResponseStatusCodeError(let statusCode):
            debugPrint( "⚠️⚠️⚠️⚠️⚠️ HTTP Response Status Code = \(statusCode) ----> \(#file): \(#line) ⚠️⚠️⚠️⚠️⚠️⚠️")
            break
        }
    }
}
