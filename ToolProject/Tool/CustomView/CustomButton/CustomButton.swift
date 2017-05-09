//
//  CustomButton.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/4/22.
//  Copyright © 2017年 每天农资. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override var isSelected: Bool {
        didSet {
            
            if isSelected {
                
                setTitleColor(UIColor(hexColor: "FFFFFF"), for: .normal)
                backgroundColor = UIColor(hexColor: "FF2A00")
            }else {
                
                setTitleColor(UIColor(hexColor: "1A1A1A"), for: .normal)
                backgroundColor = UIColor(hexColor: "E6E6E6")
            }
        }
    }
    
}
