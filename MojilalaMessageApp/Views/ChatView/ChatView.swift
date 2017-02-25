//
//  SemiCircleViewWithButton.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 22/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

class ChatView: BaseCustomView, NibLoadableView {
    
    //Outles
    @IBOutlet weak var tableView: UITableView!
    
    //properties
    fileprivate var messages = [Messages]()
    fileprivate var currentUser: User!
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nibSetup(ChatView.self)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        nibSetup(ChatView.self)
        setup()
    }
    
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.Register(ReceiverCell.self)
        tableView.Register(SenderCell.self)
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset.bottom = 50.0
        tableView.scrollIndicatorInsets.bottom = 50.0
    }
    
    //MARK: - Call
    func updateTableView(height: CGFloat) {
        //Keyboard Opening Animation
        tableView.contentInset.bottom = height
        tableView.scrollIndicatorInsets.bottom = height
        tableView.scrollToRow(at: IndexPath.init(row: messages.count-1, section: 0), at: .bottom, animated: true)
    }
    func addMessage(text: String) {
        //Sending Message Animation
        let message = Messages(id: self.messages.count, text: text, timestamp: Int(Date().timeIntervalSince1970), user: currentUser)
        messages.append(message)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath.init(row: self.messages.count-1, section: 0)], with: .bottom)
        tableView.endUpdates()
        tableView.scrollToRow(at: IndexPath.init(row: messages.count-1, section: 0), at: .bottom, animated: false)
    }
    
    //MARK: - Request
    func callMessageService(userNickName: String!) {
        ServiceManager.sharedInstance().request(success: { [unowned self](messagesResponse) in
            self.messages = messagesResponse.messages
            
            mainThread {
                self.handleMessage(userNickName: userNickName)
            }
        }) { (errorType) in
            debugPrint("\(#file): \(#line)")
            errorType.errorDescription()
        }
    }
    
    private func handleMessage(userNickName: String!) {
        messages.forEach {
            if let user = $0.user {
                if userNickName == user.nickname {
                    currentUser = user
                    return
                }
            }
        }
        if currentUser == nil {
            let newUser = User(id: 999, nickname: userNickName, avatarUrl: nil)
            currentUser = newUser
            UserManager.sharedInstance().currentUserImage = UIImage(named: "user")
        }
        tableView.reloadData()
    }
}

//MARK: - UITableViewDelegate
extension ChatView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.isDragging {
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
}

//MARK: - UITableViewDataSource
extension ChatView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        let user = message.user!
        
        if user.id == currentUser.id {
            let cell = tableView.DequeReusableCell(forIndexPath: indexPath) as ReceiverCell
            cell.setup(with: message)
            
            return cell
        } else {
            let cell = tableView.DequeReusableCell(forIndexPath: indexPath) as SenderCell
            cell.setup(with: message)
            
            return cell
        }
    }
}
