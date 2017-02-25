//
//  GlobalHelper.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 24/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

//Main Thread shortcut
func mainThread(main: @escaping () -> ()) {
    DispatchQueue.main.async(execute: {
        main()
    })
}

//Shake Label for login nickname error
class ShakeLabel:UILabel, ShakeableProtocol {}
