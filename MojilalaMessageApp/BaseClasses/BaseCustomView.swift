//
//  BaseCustomView.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 22/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

class BaseCustomView: UIView {
    @IBOutlet weak var contentView: UIView!
}

/*
 Custom viewleri nib ile cagirirken kolaylik saglar. Bu methodlari kullanmak icin viewlarin BaseCustomView'dan turemesi, contentView'i olmasi ve NibLoadableView protocolunu saglamasi lazimdir. Custom Viewlari UINib uzerinden cagirirken yazilan fazla kodu kisaltmak icin yazilmistir. nibSetup(View.self) ile nib yuklenir
 */
extension BaseCustomView {
    
    //MARK: - Generic Functions
    private func loadViewFromNib<T: BaseCustomView>(_: T.Type) -> UIView where T: NibLoadableView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName:T.NibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return nibView
    }
    
    func nibSetup<T: BaseCustomView>(_: T.Type) where T: NibLoadableView {
        
        contentView = loadViewFromNib(T.self)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(contentView)
    }
}
