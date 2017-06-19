//
//  UIImage+Extension.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/6/19.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import Foundation

extension UIImage {
    
    
    //MARK: - 返回纯色图片
    
    static func createImageWithColor(_ color: UIColor, frame: CGRect) -> UIImage? {
        
        UIGraphicsBeginImageContext(frame.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(frame)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image
    }
}
