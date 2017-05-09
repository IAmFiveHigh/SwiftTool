//
//  CommentTextView.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/5/6.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

protocol CommentTextViewDelegate: class {
    
    func submit(text: String)
    
    func rise(number: CGFloat)
}

class CommentTextView: UIView {

    var hasImage: Bool
    
    var textView: UITextView!
    
    var submitButton: UIButton!
    
    weak var delegate: CommentTextViewDelegate?
    
    init(frame: CGRect, hasImage: Bool) {
        
        self.hasImage = hasImage
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        submitButton = UIButton()
        submitButton.setupUI(font: 17, title: "发送", textColor: "1A1A1A", backColor: "F5F5F5")
        submitButton.layer.cornerRadius = 2
        submitButton.layer.borderColor = UIColor(hexColor: "DCDCDC").cgColor
        submitButton.layer.borderWidth = 0.3
        submitButton.addTarget(self, action: #selector(submit))
        addSubview(submitButton)
        
        textView = UITextView()
        textView.delegate = self
        
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.textColor = UIColor(hexColor: "1A1A1A")
        textView.layer.borderColor = UIColor(hexColor: "DCDCDC").cgColor
        textView.layer.borderWidth = 0.3
        addSubview(textView)
        
        submitButton.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.mas_top)?.with().offset()(8)
            make?.size.equalTo()(CGSize(width: 45, height: 30))
            make?.right.equalTo()(self.mas_right)?.with().offset()(-12)
        }
        
        textView.mas_makeConstraints { (make) in
            make?.left.equalTo()(self.mas_left)?.with().offset()(12)
            make?.top.equalTo()(self.mas_top)?.with().offset()(8)
            make?.right.equalTo()(self.submitButton.mas_left)?.with().offset()(-5)
            make?.bottom.equalTo()(self.mas_bottom)?.with().offset()(-8)
        }
        
        if hasImage {
            
            
        }
    }
    
    @objc fileprivate func submit() {
        
        if let delegate = delegate {
            delegate.submit(text: textView.text)
        }
    }

}


extension CommentTextView: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        textView.flashScrollIndicators()
        
        let maxHeight:CGFloat = 150
        let constraintSize = CGSize(width: textView.width(), height: screenHeight)
        var size = textView.sizeThatFits(constraintSize)
        
        if size.height >= maxHeight  {
            
            size.height = maxHeight
            textView.isScrollEnabled  = true
        }else {
            
            textView.isScrollEnabled = false
        }
        
        textView.setHeight(size.height)
        
        if let delegate = delegate {
            delegate.rise(number: size.height - 30)
        }
        
        textView.layoutIfNeeded()
    }
}
