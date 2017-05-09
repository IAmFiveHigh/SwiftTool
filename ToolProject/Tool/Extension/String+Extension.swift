//
//  String+Extension.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/5/3.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    static func getHeightWith(string: String, font: CGFloat, width: CGFloat, maxLineNumber: Int) -> CGFloat {
        
//        let nsString = string as NSString
//        let rect = nsString.boundingRect(with: CGSize(width: width, height: screenHeight), options: [.truncatesLastVisibleLine, .usesFontLeading, .usesLineFragmentOrigin], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: font)], context: nil)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 0))
        label.font = UIFont.systemFont(ofSize: font)
        label.text = string
        label.numberOfLines = maxLineNumber
        label.sizeToFit()
        
        return label.height()
    }
    
    static func boundingRectWith(str: String, font: CGFloat, width: CGFloat, maxLineNumber:Int) -> CGFloat {
        
        let nsString = str as NSString
        let rect = nsString.boundingRect(with: CGSize(width: width, height: screenHeight), options: [.truncatesLastVisibleLine, .usesFontLeading, .usesLineFragmentOrigin], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: font)], context: nil)
        
        return rect.height
    }
}
