//
//  User.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 22/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation

struct User {
    var id: Int?
    var nickname: String?
    var avatarUrl: String?
}

extension User {
    
    init(json: Dictionary<String,AnyObject>) {
        guard let id = json["id"] as? Int else {
            ErrorHandler.jsonParseError(modelMame: "User", propertyName: "id").errorDescription()
            return
        }
        
        guard let nickname = json["nickname"] as? String else {
            ErrorHandler.jsonParseError(modelMame: "User", propertyName: "nickname").errorDescription()
            return
        }
        
        guard let avatarUrl = json["avatarUrl"] as? String else {
            ErrorHandler.jsonParseError(modelMame: "User", propertyName: "avatarUrl").errorDescription()
            return
        }
        
        self.id = id
        self.nickname = nickname
        self.avatarUrl = avatarUrl
    }
}
