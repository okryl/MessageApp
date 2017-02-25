//
//  Messages.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 22/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation

struct Messages {
    var id: Int?
    var text: String?
    var timestamp: Int?
    var user: User?
}

extension Messages {
    
    init(json: Dictionary<String,AnyObject>) {
        
        guard let id = json["id"] as? Int else {
            ErrorHandler.jsonParseError(modelMame: "Messages", propertyName: "id").errorDescription()
            return
        }
        guard let text = json["text"] as? String  else {
            ErrorHandler.jsonParseError(modelMame: "Messages", propertyName: "text").errorDescription()
            return
        }
        guard let timestamp = json["timestamp"] as? Int  else {
            ErrorHandler.jsonParseError(modelMame: "Messages", propertyName: "timestamp").errorDescription()
            return
        }
        guard let user = json["user"] as? [String: AnyObject]  else {
            ErrorHandler.jsonParseError(modelMame: "Messages", propertyName: "user").errorDescription()
            return
        }
        
        self.id = id
        self.text = text
        self.timestamp = timestamp
        self.user = User(json: user)
    }
}
