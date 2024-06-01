//
//  ChattingTableViewCell.swift
//  TravelTalk_0531
//
//  Created by 최민경 on 6/1/24.
//

import UIKit

class ChattingTableViewCell: UITableViewCell {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var profileNameLabel: UILabel!
    
    @IBOutlet var chatLabelBackView: UIView!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    
    func configureUI() {
        profileImage.contentMode = .scaleAspectFill
        
        profileNameLabel.font = .boldSystemFont(ofSize: 16)
        
        chatLabel.numberOfLines = 0
        chatLabelBackView.layer.borderColor = UIColor.black.cgColor
        chatLabelBackView.layer.borderWidth = 1
        chatLabelBackView.layer.cornerRadius = 6
        chatLabelBackView.layer.masksToBounds = false
    }

    func configureCell(chatRoom: ChatRoom, chat: Chat) {
//        profileImage.image = UIImage(named: chatRoom.chatroomImage.last!)
        profileImage.image = UIImage(named: chat.user.profileImage)
        profileNameLabel.text = chatRoom.chatroomName
        
        chatLabel.text = chat.message
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        
    }
}
