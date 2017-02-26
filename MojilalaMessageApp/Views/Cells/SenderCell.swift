//
//  SenderCell.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 24/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit
import Kingfisher

class SenderCell: UITableViewCell, ReusableCell,NibLoadableView {
    
    //Outlets
    @IBOutlet weak var labelBackgroudView: UIView!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var labelNickName: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var imageSender: UIImageView!
    
    //MARK: - Init
    func setup(with message: Messages) {
        selectionStyle = .none
        
        labelMessage.text = message.text ?? ""
        labelNickName.text = message.user?.nickname ?? ""
        
        if let timestamp = message.timestamp  {
            let date = NSDate(timeIntervalSince1970: Double(timestamp))
            labelTime.text = String(describing: date)
            
        }
        
        labelBackgroudView.layer.cornerRadius = 10
        
        imageSender.layer.cornerRadius = imageSender.bounds.size.width / 2
        imageSender.contentMode = .scaleAspectFit
        imageSender.clipsToBounds = true
        
        if let user = message.user,
            let avatarUrl = user.avatarUrl,
            let imageURL = URL(string: avatarUrl) {
            imageSender.kf.setImage(with: imageURL)
        }
    }
}
