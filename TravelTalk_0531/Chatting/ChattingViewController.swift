//
//  ChattingViewController.swift
//  TravelTalk_0531
//
//  Created by 최민경 on 6/1/24.
//

import UIKit

class ChattingViewController: UIViewController {
    
    @IBOutlet var chatBackView: UIView!
    @IBOutlet var chatTableView: UITableView!
    
    @IBOutlet var chatTextView: UITextView!
    
    @IBOutlet var sendButton: UIImageView!
    
    var chatRoom: ChatRoom?
    var chat: [Chat] = []
    let placeholder = "메세지를 입력하세요"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    func configureUI() {
        
        navigationController?.navigationBar.tintColor = .black
        
        chatTableView.dataSource = self
        chatTableView.delegate = self
        chatTableView.separatorStyle = .none
    
        chatTextView.delegate = self
        chatTextView.text = placeholder
        chatTextView.textColor = .lightGray
        
        chatTextView.backgroundColor = .clear
        chatBackView.backgroundColor = .lightGray.withAlphaComponent(0.1)
        chatBackView.layer.cornerRadius = 8
          
        tableViweRegister(identifier: ChattingTableViewCell.identifier, tableName: chatTableView)
        tableViweRegister(identifier: UserChattingTableViewCell.identifier, tableName: chatTableView)
        
        navigationItem.title = chatRoom?.chatroomName
        
    }
}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
//        return 140
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatRoom?.chatList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if chatRoom?.chatList[indexPath.row].user == .user {
            let userCell = tableView.dequeueReusableCell(withIdentifier: UserChattingTableViewCell.identifier, for: indexPath) as! UserChattingTableViewCell
            guard let chatRoom = chatRoom else { return userCell }
            userCell.configureCell(chatRoom: chatRoom, chat: chat[indexPath.row])
            return userCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChattingTableViewCell.identifier, for: indexPath) as! ChattingTableViewCell
            guard let chatRoom = chatRoom else { return cell }
            cell.configureCell(chatRoom: chatRoom, chat: chat[indexPath.row])
            
            return cell
        }
    }
}

extension ChattingViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if chatTextView.text.isEmpty {
            chatTextView.text = placeholder
            chatTextView.textColor = .lightGray
        }
    }
    
}
