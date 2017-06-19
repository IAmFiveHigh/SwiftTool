//
//  UITabbar+Extension.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/6/19.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import Foundation

extension UITabBar {
    
    //MARK: - 给tabbar添加小红点
    
    
    func showBadgeOnItemIndex(_ index: Int) {
        
        let tabbarItems:CGFloat = 4
        
        hiddenBadgeOnItemIndex(index)
        
        let badge = UIView()
        badge.layer.cornerRadius = 5
        badge.backgroundColor = UIColor.red
        badge.tag = 888

        let percentX = (CGFloat(index) + 0.6) / tabbarItems
        let x = ceilf(Float(percentX * frame.width))
        let y = ceilf(Float(0.1 * frame.height))
        
        badge.frame = CGRect(x: CGFloat(x), y: CGFloat(y), width: 10, height: 10)
        addSubview(badge)
    }
    
    func hiddenBadgeOnItemIndex(_ index: Int) {
        for view in subviews {
            if view.tag == 888 {
                
                view.removeFromSuperview()
            }
        }
    }
}
