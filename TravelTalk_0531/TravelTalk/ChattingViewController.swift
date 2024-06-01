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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    func configureUI() {
        chatTableView.dataSource = self
        chatTableView.delegate = self
        
        let placeholder = "메세지를 입력하세요"
//        chatTextView.delegate = self
        chatTextView.text = placeholder
        
        
        let xib = UINib(nibName: ChattingTableViewCell.identifier, bundle: nil)
        chatTableView.register(xib, forCellReuseIdentifier: ChattingTableViewCell.identifier)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: ChattingTableViewCell.identifier, for: indexPath) as! ChattingTableViewCell
        guard let chatRoom = chatRoom else { return cell }
        cell.configureCell(chatRoom: chatRoom, chat: chat[indexPath.row])
        
        return cell
        
    }
    
    
    
    
    
}

//extension ChattingViewController: UITextViewDelegate {
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if chatTextView.text.isEmpty {
//            
//        } else {
//            
//        }
//    }
//    
//    func textViewDidEndEditing(_ textView: UITextView) {
////        chatTextView.text = placeholder
//    }
//    
//}
