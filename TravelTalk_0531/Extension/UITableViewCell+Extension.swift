//
//  UITableViewCell+Extension.swift
//  TravelTalk_0531
//
//  Created by 최민경 on 6/2/24.
//
import UIKit

extension UITableViewCell {
    
    func dateFormatConvert(lastDate: String, dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        guard let date = dateFormatter.date(from: lastDate) else { return "none"}
        
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = Locale(identifier: "ko_KR")
        let resultDate = dateFormatter.string(from: date)
        
        return resultDate
    }
}
