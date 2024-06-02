//
//  UserChattingTableViewCell.swift
//  TravelTalk_0531
//
//  Created by 최민경 on 6/1/24.
//

import UIKit

class UserChattingTableViewCell: UITableViewCell {
    
    @IBOutlet var ChatLabelBackView: UIView!
    
    @IBOutlet var chatLabel: UILabel!
    
    @IBOutlet var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI() {
        self.selectionStyle = .none
        ChatLabelBackView.configureUIView(borderColorname: UIColor.darkGray.cgColor, borderWidthSize: 1, cornerRadiusSize: 8, backColor: .lightGray.withAlphaComponent(0.3))
        
        chatLabel.numberOfLines = 0
        chatLabel.font = .systemFont(ofSize: 15)
        
        timeLabel.font = .systemFont(ofSize: 12)
        timeLabel.textColor = .darkGray
        
    }

    func configureCell(chatRoom: ChatRoom, chat: Chat) {
        
        timeLabel.text = dateFormatConvert(lastDate: chat.date, dateFormat: "MM:dd a")
        
        chatLabel.text = chat.message
        
    }
    
}
