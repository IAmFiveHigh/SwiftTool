//
//  LoginInTextField.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/6/1.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class LoginInTextField: UIView {

    var textfield: UITextField!
    
    var isError: Bool = false {
        
        didSet {
            if isError {
                
                layer.borderColor = UIColor.red.cgColor
                layer.borderWidth = 0.5
            }else {
                
                layer.borderColor = UIColor.white.cgColor
                layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        backgroundColor = UIColor(hexColor: "FFFFFF")
        
        
        textfield = UITextField()
        textfield.font = UIFont.systemFont(ofSize: 15)
        textfield.textColor = UIColor(hexColor: "000000")
        textfield.setValue(UIColor(hexColor: "CCCCCC"), forKeyPath: "placeholderLabel.textColor")
        addSubview(textfield)
        
        
        textfield.mas_makeConstraints { (make) in
            make?.left.equalTo()(self.mas_left)?.with().offset()(16)
            make?.right.equalTo()(self.mas_right)?.with().offset()(-16)
            make?.centerY.equalTo()(self.mas_centerY)
            make?.height.equalTo()(self)
        }
    }

}

class LoginInButton: UIButton {
    
    var isClicked: Bool = true {
        didSet {
            if isClicked {
                
                isEnabled = true
                backgroundColor = UIColor(hexColor: "32B4FF")
            }else {
                
                isEnabled = false
                backgroundColor = UIColor(hexColor: "CBCBCB")
            }
        }
    }
}
