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
        
        self.selectionStyle = .none
        profileImage.contentMode = .scaleAspectFill
        
        profileNameLabel.font = .boldSystemFont(ofSize: 14)
        
        chatLabel.numberOfLines = 0
        chatLabel.font = .systemFont(ofSize: 15)
        
        chatLabelBackView.configureUIView(borderColorname: UIColor.darkGray.cgColor, borderWidthSize: 1, cornerRadiusSize: 8, backColor: .clear)
        
        
        timeLabel.font = .systemFont(ofSize: 12)
        timeLabel.textColor = .darkGray
    }

    func configureCell(chatRoom: ChatRoom, chat: Chat) {
        profileImage.image = UIImage(named: chat.user.profileImage)
        profileNameLabel.text = chat.user.rawValue
        
        chatLabel.text = chat.message
        
        timeLabel.text = dateFormatConvert(lastDate: chat.date, dateFormat: "MM:dd a")
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        
    }
}
