//
//  UIBarButtonItem+Extension.swift
//  FKSinaWeibo
//
//  Created by 我是五高你敢信 on 2017/4/11.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    /// 创建 UIBarbuttonItem
    ///
    /// - Parameters:
    ///   - title: title
    ///   - fontSize: 字号大小
    ///   - target: target
    ///   - action: 方法
    ///   - isBackButton: 是否返回按钮
    convenience init(title: String, fontSize: CGFloat = 16, target: Any?, action: Selector, isBackButton: Bool = false, titleColor: UIColor = UIColor.white) {
        
        let btn = UIButton()
        btn.setWidth(50)
        btn.setHeight(32)
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.setTitleColor(titleColor, for: .normal)
        
        if isBackButton {
            
            btn.setImage(UIImage(named: "返回"), for: .normal)
            btn.setImage(UIImage(named: "返回-highlighted"), for: .highlighted)
            btn.sizeToFit()
        }
        
        self.init(customView: btn)
    }
}
