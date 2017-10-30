//
//  垂直跑马灯Label.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/10/30.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class 垂直跑马灯Label: UIView {
    
    //目前只能解决 1个 和三个以上数据源
    private var timer: Timer?
    
    var 数据源数组 = [String]() {
        didSet {
            labelArray = [label1, label2, label3]
            
            if 数据源数组.count >= 3 {
                for (index, label) in labelArray.enumerated() {
                    label.text = 数据源数组[index]
                }
                
                
                createTimer(timerIntervar: 5)
            }else {
                
                label2.text = 数据源数组.first!
            }
        }
    }
    
    private var indexRow = 2 {
        didSet {
            
            labelArray.first!.text = 数据源数组[indexRow]
        }
    }
    
    private let label1 = UILabel()
    private let label2 = UILabel()
    private let label3 = UILabel()
    private var labelArray = [UILabel]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        label1.frame = CGRect(x: 0, y: -self.height(), width: self.width(), height: self.height())
        label2.frame = CGRect(x: 0, y: 0, width: self.width(), height: self.height())
        label3.frame = CGRect(x: 0, y: self.height(), width: self.width(), height: self.height())
    }
    
    func setupUI(font: CGFloat, color: String) {
        
        label1.setUI(font: font, textColor: color)
        label2.setUI(font: font, textColor: color)
        label3.setUI(font: font, textColor: color)
        addSubview(label1)
        addSubview(label2)
        addSubview(label3)
    }
    
    //MARK: 创建timer
    fileprivate func createTimer(timerIntervar: TimeInterval) {
        
        timer = Timer(timeInterval: timerIntervar, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        RunLoop.current.add(timer!, forMode: RunLoopMode.commonModes)
        timer?.fire()
    }
    
    //MARK: timer执行方法
    @objc fileprivate func timerAction() {
        
        for (index,label) in labelArray.enumerated() {
            
            if index == 0 {
                
                label.setY(self.height())
                
            }else {
                UIView.animate(withDuration: 2, animations: {
                    let y = label.y()
                    label.setY(y - self.height())
                })
            }
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            swap(&self.labelArray[0], &self.labelArray[1])
            swap(&self.labelArray[1], &self.labelArray[2])
            if self.indexRow == self.数据源数组.count - 1 {
                self.indexRow = 2
            }else {
                self.indexRow += 1
            }
        }
        
    }
    
}
