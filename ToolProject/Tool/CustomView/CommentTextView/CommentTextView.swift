//
//  CommentTextView.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/5/6.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

//评论框的高度
let commentTextView_textViewHeight:CGFloat = 37

protocol CommentTextViewDelegate: class {
    
    func submit(text: String)
    
    func rise(number: CGFloat)
}

class CommentTextView: UIView {
    
    var hasImage: Bool
    
    var textView: UITextView!
    
    var submitButton: UIButton!
    
    var textViewLabel: UILabel!
    
    
    weak var delegate: CommentTextViewDelegate?
    
    init(frame: CGRect, hasImage: Bool) {
        
        self.hasImage = hasImage
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(hexColor: "F5F5F5")
        
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        submitButton = UIButton()
        submitButton.setupUI(font: 17, title: "发送", textColor: "1A1A1A", backColor: "FAFAFA")
        submitButton.layer.cornerRadius = 2
        submitButton.layer.borderColor = UIColor(hexColor: "DCDCDC").cgColor
        submitButton.layer.borderWidth = 1
        submitButton.addTarget(self, action: #selector(submit))
        addSubview(submitButton)
        
        textView = UITextView()
        textView.delegate = self
        
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.textColor = UIColor(hexColor: "1A1A1A")
        textView.layer.borderColor = UIColor(hexColor: "DCDCDC").cgColor
        textView.layer.borderWidth = 1
        addSubview(textView)
        
        textViewLabel = UILabel()
        textViewLabel.setUI(font: 17, textColor: "E6E6E6", typeface: .Medium)
        textViewLabel.text = ""
        addSubview(textViewLabel)
        
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
        
        textViewLabel.mas_makeConstraints { (make) in
            make?.centerY.equalTo()(self.textView)
            make?.left.equalTo()(self.textView)?.with().offset()(15)
            make?.right.equalTo()(self.textView)
            make?.height.equalTo()(17)
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
        
        let maxHeight:CGFloat = 120
        let minHeight:CGFloat = commentTextView_textViewHeight
        let constraintSize = CGSize(width: textView.width(), height: screenHeight)
        var size = textView.sizeThatFits(constraintSize)
        if size.height <= minHeight {
            
            size.height = minHeight
            textView.isScrollEnabled = false
        }else if size.height >= maxHeight  {
            
            size.height = maxHeight
            textView.isScrollEnabled  = true
        }else {
            
            textView.isScrollEnabled = false
        }
        
        textView.setHeight(size.height)
        
        if let delegate = delegate {
            delegate.rise(number: size.height - commentTextView_textViewHeight)
        }
        
        textView.layoutIfNeeded()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text != "" {
            
            textViewLabel.isHidden = true
        }
        
        if text == "" && range.location == 0 && range.length == 1 {
            
            textViewLabel.isHidden = false
        }
        return true
    }
    
}
