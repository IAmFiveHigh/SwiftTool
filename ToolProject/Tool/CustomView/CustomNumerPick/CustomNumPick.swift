//
//  CustomNumPick.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/4/21.
//  Copyright © 2017年 每天农资. All rights reserved.
//

import UIKit

protocol NumPickDelegate: class {
    
    func pickNumber(num: Int)
}

class CustomNumPick: UIView {

    var minNum: Int {
        didSet {
            num = minNum
        }
        
    }
    
    // 实际数值
    var num: Int {
        didSet {
            if num < minNum {
                num = minNum
            }
            
            middleLabel.text = "\(num)"
            
            if let delegate = delegate {
                delegate.pickNumber(num: num)
            }
        }
    }
    
    fileprivate var leftButton: UIButton!
    fileprivate var middleLabel: UILabel!
    fileprivate var rightButton: UIButton!
    
    weak var delegate: NumPickDelegate!
    
    init(frame: CGRect, minNum: Int = 1) {
        
        self.minNum = minNum
        self.num = minNum
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        
        leftButton = UIButton(type: .custom)
        leftButton.frame = CGRect(x: 0, y: 0, width: width() / 3, height: height())
        leftButton.setTitleColor(UIColor.gray, for: .normal)
        leftButton.setTitle("-", for: .normal)
        leftButton.titleLabel?.textAlignment = .center
        leftButton.addTarget(self, action: #selector(leftButtonClick), for: .touchUpInside)
        leftButton.layer.borderColor = UIColor.gray.cgColor
        leftButton.layer.borderWidth = 1
        addSubview(leftButton)
        
        rightButton = UIButton(type: .custom)
        rightButton.frame = CGRect(x: width() / 3 * 2, y: 0, width: width() / 3, height: height())
        rightButton.setTitleColor(UIColor.gray, for: .normal)
        rightButton.setTitle("+", for: .normal)
        rightButton.titleLabel?.textAlignment = .center
        rightButton.addTarget(self, action: #selector(rightButtonClick), for: .touchUpInside)
        rightButton.layer.borderColor = UIColor.gray.cgColor
        rightButton.layer.borderWidth = 1
        addSubview(rightButton)
        
        middleLabel = UILabel(frame: CGRect(x: width() / 3, y: 0, width: width() / 3, height: height()))
        middleLabel.text = "\(minNum)"
        middleLabel.textAlignment = .center
        middleLabel.textColor = UIColor.gray
        middleLabel.layer.borderColor = UIColor.gray.cgColor
        middleLabel.layer.borderWidth = 1
        addSubview(middleLabel)
        
        
    }
    
    @objc fileprivate func leftButtonClick() {
        num -= 1
    }
    
    @objc fileprivate func rightButtonClick() {
        num += 1
    }
    
    func setMin(_ num: Int) {
        
        minNum = num
    }

}
