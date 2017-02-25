//
//  ShakebleProtocol.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 23/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

protocol ShakeableProtocol { }

extension ShakeableProtocol where Self: UIView {
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.autoreverses = true
        animation.repeatCount = 5
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 5.0, y: self.center.y))
         animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5.0, y: self.center.y))
        layer.add(animation, forKey: "shake")
        
    }
}
