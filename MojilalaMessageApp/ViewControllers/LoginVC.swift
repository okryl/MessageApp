//
//  LoginVC.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 23/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var viewLogin: LoginView!
    
    //MARK: ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLogin.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Reset shared data
        UserManager.sharedInstance().currentUserNickName = nil
        UserManager.sharedInstance().currentUserImage = nil
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

//MARK: - LoginView Delegate
extension LoginVC: LoginViewDelegate {
    func buttonTapped(userNickName: String!) {
        UserManager.sharedInstance().currentUserNickName = userNickName

        let chatVC = self.storyboard?.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
        chatVC.userNickName = userNickName
      
        navigationController?.pushViewController(chatVC, animated: true)
    }
}
