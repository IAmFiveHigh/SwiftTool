//
//  SelectedButton.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/4/25.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class SelectedButton: UIButton {

    override var isSelected: Bool {
        didSet {
            if isSelected {
                
                setBackgroundImage(UIImage(named: "购物车-选中"), for: .normal)
            }else {
                setBackgroundImage(UIImage(named: "购物车-未选中"), for: .normal)
            }
        }
    }
    
    
    
    init(center: CGPoint, isSelected: Bool) {
        
        super.init(frame: CGRect(x: center.x - 10, y: center.y - 10, width: 20, height: 20))
        
        setUI(isSelected: isSelected)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    fileprivate func setUI(isSelected: Bool) {
        
        self.isSelected = isSelected
    }
}
