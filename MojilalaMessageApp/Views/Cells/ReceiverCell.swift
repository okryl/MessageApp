//
//  ReceiverCell.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 24/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

class ReceiverCell: UITableViewCell, ReusableCell,NibLoadableView {
    
    //Outlets
    @IBOutlet weak var labelBackgroundView: UIView!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var imageReceiver: UIImageView!
    
    //MARK: - Init
    func setup(with message: Messages) {
        selectionStyle = .none
        
        labelMessage.text = message.text ?? ""
        
        labelBackgroundView.layer.cornerRadius = 10
       
        imageReceiver.layer.cornerRadius = imageReceiver.frame.width / 2
        imageReceiver.contentMode = .scaleAspectFit
        imageReceiver.clipsToBounds = true
        
        //If receiver has a image
        if let image = UserManager.sharedInstance().currentUserImage {
            imageReceiver.image = image
        } else {
            //Download new image
            if let user = message.user,
                let avatarUrl = user.avatarUrl,
                let imageURL = URL(string: avatarUrl) {
                let placeholder = UIImage(named: "user")
                imageReceiver.kf.setImage(with: imageURL, placeholder: placeholder, options: nil, progressBlock: nil, completionHandler: { (image, error, cacheType, url) in
                    UserManager.sharedInstance().currentUserImage = image
                })
            }
        }
    }
}
