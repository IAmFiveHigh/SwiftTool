//
//  底部上拉提示图.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2018/1/20.
//  Copyright © 2018年 我是五高你敢信. All rights reserved.
//

import UIKit

class 底部上拉提示图: UIView {

    private let label = UILabel()
    
    var text: String = ""{
        didSet {
            label.text = text
        }
    }
    private var font: CGFloat
    private var padding: CGFloat
    
    
    init(padding: CGFloat, font: CGFloat = 14.scale自适应W) {
        
        self.font = font
        self.padding = padding
        
        super.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: padding * 2 + font))
        
        backgroundColor = UIColor(hexColor: "EBEBEB")
        setupUI()
    }
    
    
    private func setupUI() {
        
        label.setUI(font: font, textColor: "999999")
        self.addSubview(label)
        
        label.mas_makeConstraints { (make) in
            make?.centerX.equalTo()(self.mas_centerX)
            make?.top.equalTo()(self.mas_top)?.with().offset()(padding)
            make?.bottom.equalTo()(self.mas_bottom)?.with().offset()(-padding)
        }
        
        let leftLine = UIView()
        leftLine.backgroundColor = UIColor(hexColor: "D1D1D1")
        self.addSubview(leftLine)
        
        
        let rightLine = UIView()
        rightLine.backgroundColor = UIColor(hexColor: "D1D1D1")
        self.addSubview(rightLine)
        
        leftLine.mas_makeConstraints { (make) in
            make?.right.equalTo()(self.label.mas_left)?.with().offset()(-5.scale自适应W)
            make?.width.equalTo()(27.scale自适应W)
            make?.height.equalTo()(1.scale自适应H)
            make?.centerY.equalTo()(self.label.mas_centerY)
        }
        
        rightLine.mas_makeConstraints { (make) in
            make?.left.equalTo()(self.label.mas_right)?.with().offset()(5.scale自适应W)
            make?.width.equalTo()(27.scale自适应W)
            make?.height.equalTo()(1.scale自适应H)
            make?.centerY.equalTo()(self.label.mas_centerY)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
