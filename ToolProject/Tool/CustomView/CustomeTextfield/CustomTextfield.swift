//
//  CustomTextfield.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/4/21.
//  Copyright © 2017年 每天农资. All rights reserved.
//

import UIKit

class CustomTextfield: UIView {

    var textfield: UITextField!
    
    init(frame: CGRect, imageName: String, placeholder: String, keyboard: UIKeyboardType) {
        super.init(frame: frame)
        textfield = setupUI(with: imageName, placeholder: placeholder, keyboard: keyboard)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setupUI(with imageName: String, placeholder: String, keyboard: UIKeyboardType) -> UITextField {
        
        // 背景
        let backView = UIView(frame: bounds)
        backView.backgroundColor = UIColor.white
        backView.layer.cornerRadius = 4
        backView.layer.borderColor = UIColor.darkGray.cgColor
        backView.layer.borderWidth = 1
        backView.backgroundColor = UIColor.clear
        addSubview(backView)
        
        // 用户图标
        let image = UIImageView(frame: CGRect(x: backView.x() + 8, y: backView.y() + 8, width: 11, height: backView.height() - 8 * 2))
        image.image = UIImage(named: imageName)
        addSubview(image)
        
        let textfield = UITextField()
        textfield.frame = CGRect(x: image.right() + 8, y: image.y(), width: backView.width() - image.width() - 8 * 2, height: image.height())
        textfield.placeholder = placeholder
        textfield.keyboardType = keyboard
        
        // 输入密码隐藏显示
        if keyboard == .default {
            
            textfield.isSecureTextEntry = true
        }
        addSubview(textfield)
        
        return textfield
    }

}
