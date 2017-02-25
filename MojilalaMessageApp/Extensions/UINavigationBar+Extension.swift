//
//  UINavigationBar+Extension.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 24/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func transparentNavigationBar() {
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
        titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        isTranslucent = true
    }
    
    func blueStyleNavigationBar() {
        barTintColor = UIColor(red: 0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
        tintColor = .white
        titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        isTranslucent = false
    }
}
