//
//  UIView+Extension.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/4/20.
//  Copyright © 2017年 每天农资. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height


extension UIView {
    //MARK: -UIView 的扩展
    
    static func backLine(with color: String, y: CGFloat, width: CGFloat, to superView: UIView) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: y, width: screenWidth, height: width))
        view.backgroundColor = UIColor(hexColor: color)
        superView.addSubview(view)
        return view
    }
    
    static func backLineWithFit(with color: String, y: CGFloat, width: CGFloat, to superView: UIView) -> UIView {
        let view = UIView(frame: CGRect(x: 8, y: y, width: screenWidth - 8 * 2, height: width))
        view.backgroundColor = UIColor(hexColor: color)
        superView.addSubview(view)
        return view
    }
    
    //size
    func viewSize() -> CGSize {
        return frame.size
    }
    
    func setViewSize(_ viewSize: CGSize) {
        frame.size = viewSize
    }
    
    //origin
    func origin() -> CGPoint {
        return frame.origin
    }
    
    func setOrigin(origin:CGPoint) {
        frame.origin = origin
    }
    
    //x
    func x() -> CGFloat {
        return frame.origin.x
    }
    
    func setX(_ x: CGFloat) {
        frame.origin.x = x
    }
    
    //y
    func y() -> CGFloat {
        return frame.origin.y
    }
    
    func setY(_ y: CGFloat) {
        frame.origin.y = y
    }
    
    //width
    func width() -> CGFloat {
        return frame.size.width
    }
    
    func setWidth(_ width: CGFloat) {
        frame.size.width = width
    }
    
    //height
    func height() -> CGFloat {
        return frame.size.height
    }
    
    func setHeight(_ height: CGFloat) {
        frame.size.height = height
    }
    
    //top
    func top() -> CGFloat {
        return frame.origin.y
    }
    
    func setTop(_ top: CGFloat) {
        frame.origin.y = top
    }
    
    //bottom
    func bottom() -> CGFloat {
        return frame.origin.y + frame.size.height
    }
    
    func setBottom(_ bottom: CGFloat) {
        frame.origin.y = bottom - self.height()
    }
    
    //left
    func left() -> CGFloat {
        return frame.origin.x
    }
    
    func setLeft(_ left: CGFloat) {
        frame.origin.x = left
    }
    
    //right
    func right() -> CGFloat {
        return self.x() + self.width()
    }
    
    func setRight(_ right: CGFloat) {
        frame.origin.x = right - self.width()
    }
    
    //centerX
    func centerX() -> CGFloat {
        return center.x
    }
    
    func setCenterX(_ centerX: CGFloat) {
        center.x = centerX
    }
    
    //centerY
    func centerY() -> CGFloat {
        return center.y
    }
    
    func setCenterY(_ centerY: CGFloat) {
        center.y = centerY
    }
    
    //middleWidth
    func middleWidth() -> CGFloat {
        return self.width() / 2
    }
    
    //middleHeight
    func middleHeight() -> CGFloat {
        return self.height() / 2
    }
}

