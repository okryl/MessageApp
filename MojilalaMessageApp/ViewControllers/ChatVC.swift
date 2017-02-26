//
//  ChatVC.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 22/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    //MARK: - Outles
    @IBOutlet weak var viewChat: ChatView!
    @IBOutlet var inputBar: UIView!
    @IBOutlet weak var inputTextField: UITextField!
    override var inputAccessoryView: UIView? {
        get {
            self.inputBar.frame.size.height = self.inpurBarHeight
            self.inputBar.clipsToBounds = true
            return self.inputBar
        }
    }
    override var canBecomeFirstResponder: Bool{
        return true
    }
    
    //MARK: Properties
    private let inpurBarHeight: CGFloat = 50
    var userNickName: String!
    
    //MARK: ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.showKeyboard(notification:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.hideKeyboard(notification:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        
        viewChat.callMessageService(userNickName: userNickName)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
 
    //MARK: - Setup UI
    private func setupUI() {
        navigationController?.navigationBar.blueStyleNavigationBar()
        navigationItem.title = userNickName
        
        inputBar.backgroundColor = UIColor.clear

    }
   
    //MARK: - Button Actions
    @IBAction func sendMessage(_ sender: Any) {
        if let text = self.inputTextField.text {
            if text.characters.count > 0 {
                viewChat.addMessage(text: text)
                self.inputTextField.text = ""
            }
        }
    }
    
    //MARK: Keyboard NotificationCenter Handlers
    func showKeyboard(notification: Notification) {
        if let frame = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let height = frame.cgRectValue.height
            viewChat.updateTableView(height: height)
        }
    }
    
    func hideKeyboard(notification: Notification) {
        viewChat.updateTableView(height: inpurBarHeight)
    }
}

//MARK: - UITextFieldDelegate
extension ChatVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



