//
//  VerticalButton.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/5/6.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class VerticalButton: UIButton {

//    -(void)layoutSubviews
//    {
//    [super layoutSubviews];
//    CGFloat midX = self.frame.size.width / 2;
//    CGFloat midY = self.frame.size.height/ 2 ;
//    self.titleLabel.center = CGPointMake(midX, midY + 15);
//    self.imageView.center = CGPointMake(midX, midY - 10);
//    
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let midX = self.width() / 2
        let midY = self.height() / 2
        titleLabel?.center = CGPoint(x: midX, y: midY + 15)
        imageView?.center = CGPoint(x: midX, y: midY - 10)
    }

}
