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
        
        firstProfileImageView.contentMode = .scaleAspectFill
        secondProfileImageView.contentMode = .scaleAspectFill
        thirdProfileImageView.contentMode = .scaleAspectFill
        fourthProfileImageView.contentMode = .scaleAspectFill
        
    }
    
    
    func configureCell(chatRoom: ChatRoom, chat: Chat) {
        
        profileNameLabel.text = chatRoom.chatroomName
        
        userCountLabel.text = String(chatRoom.chatroomImage.count)
        chatLabel.text = chat.message
        timeLabel.text = dateFormatConvert(lastDate: chat.date, dateFormat: "YY.MM.dd")
        
        let imageName = chatRoom.chatroomImage
        firstProfileImageView.image = UIImage(named: imageName[0])
        secondProfileImageView.image = UIImage(named: imageName[1])
        thirdProfileImageView.image = UIImage(named: imageName[2])
        fourthProfileImageView.image = UIImage(named: imageName[3])
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //        firstProfileImageView.layer.cornerRadius = 8
        firstProfileImageView.layer.cornerRadius = firstProfileImageView.frame.height / 2
        //        secondProfileImageView.layer.cornerRadius = 8
        secondProfileImageView.layer.cornerRadius = firstProfileImageView.frame.height / 2
        thirdProfileImageView.layer.cornerRadius = firstProfileImageView.frame.height / 2
        //        thirdProfileImageView.layer.cornerRadius = 8
        fourthProfileImageView.layer.cornerRadius = firstProfileImageView.frame.height / 2
        //        fourthProfileImageView.layer.cornerRadius = 8
        
    }
    
}
