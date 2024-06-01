//
//  ReuseIdentifierProtocol.swift
//  TravelTalk_0531
//
//  Created by 최민경 on 6/1/24.
//

import UIKit

protocol ReuseIdentifierProtocol {
    
    static var identifier: String { get }
    
}


extension UIViewController: ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
