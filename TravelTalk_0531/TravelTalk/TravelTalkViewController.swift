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
    
    var filterList: [ChatRoom] = []
    
    
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
        
        searchTextField.delegate = self
        
        // 테이블뷰에 셀 등록
        tableViweRegister(identifier: TravelTalkTableViewCell.identifier, tableName: travelTalkTableView)
        tableViweRegister(identifier: ChatRoomTableViewCell.identifier, tableName: travelTalkTableView)
        
        travelTalkTableView.dataSource = self
        travelTalkTableView.delegate = self
        travelTalkTableView.separatorStyle = .none
        
        
        
        navigationItem.backButtonTitle = ""
        
        filterList = mockChatList
    }
    
   
    
//    func scrollToRow(indexPath: IndexPath, scrollPosition: UITableView.ScrollPosition, anibated: Bool) {
//
//        
//    }
    
    
}

extension TravelTalkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatroomCount = filterList[indexPath.row].chatroomImage.count
          if chatroomCount > 1 {
              let roomCell = tableView.dequeueReusableCell(withIdentifier: ChatRoomTableViewCell.identifier, for: indexPath) as! ChatRoomTableViewCell
              
              let chatRoom = filterList[indexPath.row]
              guard let chatData = chatRoom.chatList.last else { return roomCell }
              roomCell.configureCell(chatRoom: chatRoom, chat: chatData)
              
              roomCell.selectionStyle = .none // 셀 선택 시 회색 하이라이트 제거
              // roomCell을 설정하는 추가 코드
              return roomCell
          } else {
              let chatCell = tableView.dequeueReusableCell(withIdentifier: TravelTalkTableViewCell.identifier, for: indexPath) as! TravelTalkTableViewCell
              let chatRoom = filterList[indexPath.row]
              guard let lastChat = chatRoom.chatList.last else { return chatCell }
              chatCell.configureCell(chatRoom: chatRoom, chat: lastChat)
              chatCell.selectionStyle = .none // 셀 선택 시 회색 하이라이트 제거
              
              
              return chatCell
          }
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


extension TravelTalkViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if text.isEmpty {
            filterList = mockChatList
            travelTalkTableView.reloadData()
            print("안돼?")
        } else {
            var filterName: [ChatRoom] = []
            for filter in filterList {
                if filter.chatroomName.contains(text) {
                    filterName.append(filter)
                    print("돼?")
                }
            }
            filterList = filterName
            travelTalkTableView.reloadData()
           
        }
        
    }
}
