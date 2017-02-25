//
//  NibLoadableView.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 22/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

protocol NibLoadableView {}
/*
 Nib isimlerini donmeyi saglar. Bunu kullanan UIViewlar NibLoadleView protocolunu saglamalidir.
 */

extension NibLoadableView where Self: UIView {
    
    static var NibName: String {
        return String(describing: self)
    }
    
}
