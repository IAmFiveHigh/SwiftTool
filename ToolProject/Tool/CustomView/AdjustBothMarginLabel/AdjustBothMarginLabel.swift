//
//  AdjustBothMarginLabel.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/7/10.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class AdjustBothMarginLabel: UIView {

    var leftLabel: UILabel!
    var rightLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        leftLabel = UILabel()
        rightLabel = UILabel()
        
        addSubview(leftLabel)
        addSubview(rightLabel)
        
        leftLabel.mas_makeConstraints { (make) in
            make?.left.equalTo()(self.mas_left)?.with().offset()(12)
            make?.height.equalTo()(self)
            make?.top.equalTo()(self)
        }
        
        rightLabel.mas_makeConstraints { (make) in
            make?.right.equalTo()(self.mas_right)?.with().offset()(-12)
            make?.height.equalTo()(self)
            make?.top.equalTo()(self)
        }
    }

}
