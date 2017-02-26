//
//  ReusableCell.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 26/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

protocol ReusableCell: class {}

/*
 UITableView leri register ederken kolaylik saglamasi icin yazilmis generic methoddur. UITableViewCell'lerin reuseIdentiferi getirir. Class ismi ile reuseIdentifier ayni olur. Bu methodu kullanmak isteyen cell'ler ReusableCell protokolunu saglamalidir.
 */
extension ReusableCell where Self: UIView {
    
    static var ReuseIdentifier: String {
        return String(describing: self)
    }
}

