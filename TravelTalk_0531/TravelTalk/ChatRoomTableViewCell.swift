//
//  ChatRoomTableViewCell.swift
//  TravelTalk_0531
//
//  Created by 최민경 on 6/2/24.
//

import UIKit

class ChatRoomTableViewCell: UITableViewCell {
    
    @IBOutlet var firstProfileImageView: UIImageView!
    @IBOutlet var secondProfileImageView: UIImageView!
    @IBOutlet var thirdProfileImageView: UIImageView!
    @IBOutlet var fourthProfileImageView: UIImageView!
    
    @IBOutlet var profileNameLabel: UILabel!
    @IBOutlet var userCountLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    
    @IBOutlet var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI() {
//        profileImageView.contentMode = .scaleAspectFill
        profileNameLabel.font = .boldSystemFont(ofSize: 17)
        
        chatLabel.font = .systemFont(ofSize: 15)
        chatLabel.textColor = .darkGray
        
        userCountLabel.font = .systemFont(ofSize: 15)
        timeLabel.font = .systemFont(ofSize: 13)
        timeLabel.textColor = .lightGray
        
    }
    
    
    func configureCell(chatRoom: ChatRoom, chat: Chat) {
        
        profileNameLabel.text = chatRoom.chatroomName
        
        userCountLabel.text = String(chatRoom.chatroomImage.count)
        chatLabel.text = chat.message
        timeLabel.text = chat.date
        
//        if let imageName = chatRoom.chatroomImage.first {
//            firstProfileImageView.image = UIImage(systemName: imageName)
//        } else {
//            print("없어")
//        }
    }
    
    
}
