//
//  UIView+Extension.swift
//  TravelTalk_0531
//
//  Created by 최민경 on 6/1/24.
//

import Foundation
import UIKit

extension UIView {
    
    func configureUIView(borderColorname: CGColor, borderWidthSize: CGFloat, cornerRadiusSize: CGFloat, backColor: UIColor){
        layer.borderColor = borderColorname
        layer.borderWidth = borderWidthSize
        layer.cornerRadius = cornerRadiusSize
        backgroundColor = backColor
    }
    
}
