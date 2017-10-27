//
//  CGFloat+Extension.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/10/27.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import Foundation

extension CGFloat {
    var scale自适应H: CGFloat {
        get {
            return self * screenHeight / 667
        }
    }
    
    var scale自适应W: CGFloat {
        get {
            return self * screenWidth / 375
        }
    }
}

extension Int {
    var scale自适应H: CGFloat {
        get {
            return CGFloat(self) * screenHeight / 667
        }
    }
    
    var scale自适应W: CGFloat {
        get {
            return CGFloat(self) * screenWidth / 375
        }
    }
}
