//
//  MessageResponse.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 22/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation

struct MessageResponse {
    var messages = [Messages]()
    
    init(json: Dictionary<String,AnyObject>) {
        guard let messagesArray = json["messages"] as? NSArray else {return}
        
        messagesArray.forEach { (messages) in
            let messages = Messages(json: messages as! Dictionary<String, AnyObject>)
            self.messages.append(messages)
        }
    }
}
