//
//  UserManager.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 23/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

//Provide to save  user session data
final class UserManager: NSObject {
    
    private static var instance : UserManager?
    var currentUserNickName: String? {
        get {
            if let returnValue = UserDefaults.standard.object(forKey: "nickName") as? String {
                return returnValue
            } else {
                return nil
            }
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "nickName")
            UserDefaults.standard.synchronize()
        }
    }
    var currentUserImage: UIImage?
    
    static func sharedInstance() -> UserManager {
        if instance == nil {
            instance = UserManager()
        }
        return instance!
    }
}

