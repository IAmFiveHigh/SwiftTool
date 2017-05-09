//
//  BaseTextField.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/4/27.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class BaseTextField: UIView {

    var textfield: UITextField!
    
    init(frame: CGRect, font: CGFloat = 14, title: String, placeholder: String = "", keyboard: UIKeyboardType = .default, margin: CGFloat = 12) {
        super.init(frame: frame)
        textfield = setupUI(with: title, font: font, placeholder: placeholder, keyboard: keyboard, margin: margin)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setupUI(with title: String, font: CGFloat, placeholder: String, keyboard: UIKeyboardType, margin: CGFloat) -> UITextField {
        
        // 用户title
        let titleLabel = UILabel(frame: CGRect(x: 20, y: 8, width: 70, height: height() - 8 * 2))
        titleLabel.setUI(font: font, textColor: "333333", typeface: .Medium)
        titleLabel.text = title
        addSubview(titleLabel)
        
        let textfield = UITextField()
        textfield.frame = CGRect(x: titleLabel.right() + margin, y: titleLabel.y(), width: screenWidth - titleLabel.width() - margin - 12 * 2, height: titleLabel.height())
        textfield.font = UIFont(name: "STHeitiTC-Medium", size: font)
        textfield.placeholder = placeholder
        textfield.keyboardType = keyboard
        

        addSubview(textfield)
        
        _ = UIView.backLine(with: "E6E6E6", y: textfield.bottom() + 8, width: 1, to: self)
        
        return textfield
    }


}
