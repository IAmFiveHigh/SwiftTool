//
//  BaseTextView.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/5/9.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

extension UITextView {

    
    func addToolbarWithTarget(_ target: Any , action: Selector) {
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 35))
        toolbar.backgroundColor  = UIColor(hexColor: "FFFFFF")
        toolbar.barStyle = .default
        let doneItem = UIBarButtonItem(title: "完成编辑", target: target, action: action, titleColor: UIColor(hexColor: "32B4FF"))
        
        toolbar.items = [doneItem]
        self.inputAccessoryView = toolbar
    }

}
