//
//  SubCommentView.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/5/6.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class SubCommentView: UIView {

    var backgroundView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: width(), height: height()))
        backgroundView.backgroundColor = UIColor(hexColor: "E6E6E6")
        backgroundView.layer.cornerRadius = 8
        addSubview(backgroundView)
        
    }
    
    func addComment(array: [PostCommentSubCommentModel]) -> CGFloat {
        
        var viewY: CGFloat = 5
        
        for model in array {
            
            let name = model.NAME
            let message = model.MESSAGE
            
            let label = UILabel(frame: CGRect(x: 8, y: viewY, width: width() - 8 * 2, height: 100))
            
            let attributeString = NSMutableAttributedString(string: name + ":  " + message)
            attributeString.addAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 17), NSForegroundColorAttributeName: UIColor(hexColor: "32B4FF")], range: NSRange(location: 0, length: (name.characters.count)))
            attributeString.addAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 17), NSForegroundColorAttributeName: UIColor(hexColor: "1A1A1A")], range: NSRange(location: (name.characters.count + 2), length: (message.characters.count)))
            
            let height = attributeString.boundingRect(with: CGSize(width: width() - 8 * 2, height: screenHeight), options: [.truncatesLastVisibleLine, .usesFontLeading, .usesLineFragmentOrigin], context: nil).height
            viewY += height
            viewY += 5
            
            label.attributedText = attributeString
            label.numberOfLines = 0
            label.sizeToFit()
            addSubview(label)
            
        }
        backgroundView.setHeight(viewY)
        return viewY
    }

}
