//
//  TravelTalkViewController.swift
//  TravelTalk_0531
//
//  Created by 최민경 on 6/1/24.
//

import UIKit

class TravelTalkViewController: UIViewController {
    
    
    
    @IBOutlet var searchBackView: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var travelTalkTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI(){
        navigationItem.title = "TRAVEL TALK"
        
        searchBackView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        searchBackView.layer.cornerRadius = 8
        
        searchTextField.placeholder = "친구 이름을 검색해보세요"
        searchTextField.font = .boldSystemFont(ofSize: 17)
        searchTextField.backgroundColor = .clear
        searchTextField.borderStyle = .none
        
        let xib = UINib(nibName: TravelTalkTableViewCell.identifier, bundle: nil)
        travelTalkTableView.register(xib, forCellReuseIdentifier: TravelTalkTableViewCell.identifier)
        
        travelTalkTableView.dataSource = self
        travelTalkTableView.delegate = self
        travelTalkTableView.separatorStyle = .none
        
        navigationItem.backButtonTitle = ""
        navigationItem.backBarButtonItem?.tintColor = .black
    }
}

extension TravelTalkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelTalkTableViewCell.identifier, for: indexPath) as! TravelTalkTableViewCell
        
        let chatRomm = mockChatList[indexPath.row]
        if let lastChat = chatRomm.chatList.last {
            cell.configureCell(chatRoom: chatRomm, chat: lastChat)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(identifier: ChattingViewController.identifier) as! ChattingViewController
        let chatroom = mockChatList[indexPath.row]
        vc.chatRoom = mockChatList[indexPath.row]
        vc.chat = chatroom.chatList
        navigationController?.pushViewController(vc, animated: true)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    
    
    
    
    
}
