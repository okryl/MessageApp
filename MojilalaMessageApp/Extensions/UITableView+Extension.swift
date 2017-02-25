//
//  UITableView+Extension.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 24/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//


import UIKit

/*
 tableView.register ve tableView.dequeReuseCell methodlarinin protocol oriented ile generic yazilmis methodlaridir. Bu methodlari kullanmak isteyen cell ler ReusableCell ve NibLoadableView protocollerini saglamalidir. tableView.Register(Cell.self) ve tableView.DequeReusableCell(Cell.self) as! CellType ile cagrilir
 */

extension UITableView {
    
    func Register<T: UITableViewCell>(_: T.Type) where T: ReusableCell, T: NibLoadableView {
        
        let nib = UINib(nibName: T.NibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.ReuseIdentifier)
    }
    
    func DequeReusableCell<T:UITableViewCell>(forIndexPath indexPath: IndexPath!) -> T where T: ReusableCell {
        
        guard let cell = dequeueReusableCell(withIdentifier: T.ReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.ReuseIdentifier)")
        }
        
        return cell
    }
}
