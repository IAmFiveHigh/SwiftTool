//
//  KeyWordLabel.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/5/3.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class KeyWordLabel: UIView {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder) 
        createUI()
    }
    
    fileprivate func createUI()  {
        
        label.frame = CGRect(x: 5, y: 5, width: width() - 2 * 2, height: height() - 2 * 2)
        label.setUI(font: 14, textColor: "BFBFBF", typeface: .Medium)
        addSubview(label)
        
        label.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.mas_top)?.with().offset()(2)
            make?.left.equalTo()(self.mas_left)?.with().offset()(2)
            make?.bottom.equalTo()(self.mas_bottom)?.with().offset()(-2)
            make?.right.equalTo()(self.mas_right)?.with().offset()(-2)
        }
    }
    
    func setText(_ text: String) {
        
        label.text = text
        label.sizeToFit()
        
        layer.cornerRadius = 5
        layer.borderColor = UIColor(hexColor: "BFBFBF").cgColor
        layer.borderWidth = 1
    }

}
