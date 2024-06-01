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
        
        profileNameLabel.font = .boldSystemFont(ofSize: 14)
        
        chatLabel.numberOfLines = 0
        chatLabel.font = .systemFont(ofSize: 15)
        
        chatLabelBackView.layer.borderColor = UIColor.darkGray.cgColor
        chatLabelBackView.layer.borderWidth = 1
        chatLabelBackView.layer.cornerRadius = 8
        chatLabelBackView.layer.masksToBounds = false
        chatLabelBackView.backgroundColor = .clear
        
        timeLabel.font = .systemFont(ofSize: 12)
        timeLabel.textColor = .darkGray
    }

    func configureCell(chatRoom: ChatRoom, chat: Chat) {
//        profileImage.image = UIImage(named: chatRoom.chatroomImage.last!)
        profileImage.image = UIImage(named: chat.user.profileImage)
        profileNameLabel.text = chat.user.rawValue
        
        chatLabel.text = chat.message
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        
    }
}
