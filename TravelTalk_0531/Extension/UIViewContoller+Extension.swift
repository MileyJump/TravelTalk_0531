//
//  UIViewContoller+Extension.swift
//  TravelTalk_0531
//
//  Created by 최민경 on 6/1/24.
//

import Foundation
import UIKit

extension UIViewController {
     func tableViweRegister(identifier: String, tableName: UITableView) {
        let xib = UINib(nibName: identifier, bundle: nil)
        tableName.register(xib, forCellReuseIdentifier: identifier)
        
    }
}
