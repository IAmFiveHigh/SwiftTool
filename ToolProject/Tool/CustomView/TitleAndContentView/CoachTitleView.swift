//
//  CoachTitleView.swift
//  优快学车Boss
//
//  Created by 我是五高你敢信 on 2017/1/10.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

protocol CoachTitleViewDelegate: class {
    
    func coachTitleView(_ titleView: CoachTitleView, selectIndex: Int)

}

//MARK: 定义属性
private let kScrollLineH: CGFloat = 1
private let kNormalColor: (CGFloat, CGFloat, CGFloat) = (54, 54, 54)
private let kSelectColor: (CGFloat, CGFloat, CGFloat) = (74, 194, 245)

class CoachTitleView: UIView {
    
    fileprivate var currentIndex: Int = 0
    
    var titles:[String]
    
    weak var delegate: CoachTitleViewDelegate?
    
    //MARK: 懒加载
    fileprivate lazy var titleButtons: [UIButton] = [UIButton]()
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    fileprivate lazy var scrollLine: UIView = {
       
        let scrollLine = UIView()
        scrollLine.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        return scrollLine
    }()
    
    //MARK: 自定义构造函数
    init(frame: CGRect, titles: [String]) {
        
        self.titles = titles
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CoachTitleView {
    
    fileprivate func setupUI() {
        
        //设置界面
        createTitleButton()
        
        createScrollLine()
        
    }
    
    fileprivate func createTitleButton() {
        
        //设置头部button
        let buttonWidth: CGFloat = screenWidth / CGFloat(titles.count)
        let buttonH: CGFloat = height() - kScrollLineH * 2
        let buttonY: CGFloat = 0
        
        for (index,title) in titles.enumerated() {
            
            let button = UIButton()
            
            button.setTitle(title, for: .normal)
            button.setTitleColor(UIColor.gray, for: .normal)
            button.setTitleColor(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), for: .selected)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            button.titleLabel?.textAlignment = .center
            
            button.tag = index + 10
            
            button.frame = CGRect(x: CGFloat(index) * buttonWidth, y: buttonY, width: buttonWidth, height: buttonH)
            
            scrollView.addSubview(button)
            titleButtons.append(button)
            
            button.addTarget(self, action: #selector(titleButtonClick(sender:)), for: .touchUpInside)
            
        }
    }
    
    fileprivate func createScrollLine() {
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        bottomLine.frame = CGRect(x: 0, y: height() - kScrollLineH, width: width(), height: kScrollLineH)
        addSubview(bottomLine)
        
        guard let firstButton = titleButtons.first else { return }
        
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: 0, y: height() - kScrollLineH * 2, width: firstButton.width(), height: kScrollLineH * 2)
        scrollLine.setCenterX(firstButton.centerX())
        
        addSubview(scrollView)
        scrollView.frame = bounds
    }
}

extension CoachTitleView {
    
    @objc fileprivate func titleButtonClick(sender: UIButton) {
        
        //获取当前点击button
        
        //确保不是重复点击同一个button
        if sender.tag - 10 == currentIndex { return }
        
        currentIndex = sender.tag - 10
        
        UIView.animate(withDuration: 0.15, animations: {
            self.scrollLine.setCenterX(sender.centerX())
        })
        
        delegate?.coachTitleView(self, selectIndex: currentIndex)
    }
}

// MARK:- 对外暴露的方法
extension CoachTitleView {
    func setTitleWithProgress(_ progress: CGFloat, sourceIndex: Int, targetIndex: Int)  {
        // 1.取出sourceLabel/targetLabel
        let sourceLabel = titleButtons[sourceIndex]
        let targetLabel = titleButtons[targetIndex]
        
        // 2.处理滑块的逻辑
        let moveTotalX = targetLabel.centerX() - sourceLabel.centerX()
        let moveX = moveTotalX * progress
        scrollLine.setCenterX(sourceLabel.centerX() + moveX)
        
        // 3.记录最新的index
        currentIndex = targetIndex
    }
}

