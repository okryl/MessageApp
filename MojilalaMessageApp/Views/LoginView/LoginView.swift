//
//  LoginView.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 23/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit
protocol LoginViewDelegate: class {
    func buttonTapped(userNickName: String!)
}

class LoginView: BaseCustomView, NibLoadableView {
    
    //Outles
    @IBOutlet weak var buttonContinue: UIButton!
    @IBOutlet weak var labelError: ShakeLabel!
    @IBOutlet weak var textFieldNickName: UITextField!
    
    //properties
    weak var delegate: LoginViewDelegate?
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nibSetup(LoginView.self)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        nibSetup(LoginView.self)
        setup()
    }
    
    private func setup() {
        
        textFieldNickName.delegate = self
        textFieldNickName.enablesReturnKeyAutomatically = true
        textFieldNickName.autocorrectionType = .no
        
        labelError.isHidden = true
        
        buttonContinue.layer.cornerRadius = 5
    }
    
    //MARK: - Button Actions
    @IBAction func buttonTappedContinue(_ sender: UIButton) {
        textFieldNickName.resignFirstResponder()
       
        if let text = textFieldNickName.text {
            if text.characters.count < 3 {
                labelError.isHidden = false
                labelError.shake()
            } else {
                labelError.isHidden = true
                textFieldNickName.text = nil
                delegate?.buttonTapped(userNickName: text)
            }
        }
    }
}

//MARK: - UITextField Delegate
extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == " " && textField.text == "" {
            return false
        }
        
        return true
    }
}


