//
//  TravelTalkTableViewCell.swift
//  TravelTalk_0531
//
//  Created by 최민경 on 6/1/24.
//

import UIKit

class TravelTalkTableViewCell: UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var contentsLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        configureUI()
        
    }
    
    func configureCell(chatRoom: ChatRoom, chat: Chat ) {
        
        profileImageView.image = UIImage(named:chat.user.profileImage )
        nameLabel.text = chat.user.rawValue
        contentsLabel.text = chat.message
//        let dateformatter = DateFormatter()
//        dateformatter.dateFormat = "yy.MM.dd"
        
        dateLabel.text = chat.date
    }
    
    func configureUI() {
        profileImageView.contentMode = .scaleAspectFill
        nameLabel.font = .boldSystemFont(ofSize: 17)
        
        contentsLabel.font = .systemFont(ofSize: 15)
        contentsLabel.textColor = .darkGray
        dateLabel.font = .systemFont(ofSize: 13)
        dateLabel.textColor = .lightGray
        
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
    
}

