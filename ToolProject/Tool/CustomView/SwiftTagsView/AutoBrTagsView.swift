//
//  AutoBrTagsView.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/7/5.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//


import UIKit

class TagsButton: UIButton {
    
    var selectBgColor = UIColor.white
//    var selectTitleColor = ""
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                
                self.backgroundColor = selectBgColor
                self.layer.borderColor = selectBgColor.cgColor
            }else {
                
                self.layer.borderColor = self.titleLabel?.textColor.cgColor
                self.backgroundColor = UIColor.white
            }
        }
    }
}


class AutoBrTagsView: UIView {

    var colusure: ((Set<Int>) -> ())?
    
    var selectIndexArray = Set<Int>()
    
    func createButtonWith(titleArray: [String], titleFont: CGFloat = 15, titleColor: String = "BFBFBF", bgColor: String = "FFFFFF", selectBgColor: String = "E84343", selectTitleColor: String = "FFFFFF") -> CGFloat {
        
        var coordinateX: CGFloat = 0
        var row: Int = 0
        
        for (index, title) in titleArray.enumerated() {
            
            let button = TagsButton(type: .custom)
            button.tag = index
            button.backgroundColor = UIColor(hexColor: bgColor)
            button.selectBgColor = UIColor(hexColor: selectBgColor)
            button.setTitle(title, for: .normal)
            button.setTitleColor(UIColor(hexColor: titleColor), for: .normal)
            button.setTitleColor(UIColor(hexColor: selectTitleColor), for: .selected)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor(hexColor: titleColor).cgColor
            button.titleLabel?.font = UIFont.systemFont(ofSize: titleFont)
            let NSTitle = NSString(string: title)
            
            var titleSize = NSTitle .boundingRect(with: CGSize(width: width(), height: 100.0), options: [.usesFontLeading, .truncatesLastVisibleLine, .usesDeviceMetrics], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: titleFont)], context: nil).size
            titleSize.width += 10
            
            coordinateX += titleSize.width + 10
            
            if coordinateX >= width() {
                coordinateX = titleSize.width
                row += 1
                button.frame = CGRect(x: 10, y: 10 + 45 * CGFloat(row), width: titleSize.width, height: 35)
                coordinateX += 10
            }else {
                button.frame = CGRect(x: coordinateX - titleSize.width, y: 10 + 45 * CGFloat(row), width: titleSize.width, height: 35)
            }
            addSubview(button)
            button.addTarget(self, action: #selector(buttonClick(sender:)))
        }
        
        return CGFloat(row) * 45 + 10 + 30;
    }
    
    @objc fileprivate func buttonClick(sender: TagsButton) {
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            
            selectIndexArray.insert(sender.tag)
        }else {
            
            selectIndexArray.remove(sender.tag)
        }
        
        if let colusure = colusure {
            colusure(self.selectIndexArray)
        }
        
    }
    
    func addClosure(_ closure: @escaping (Set<Int>) -> ()) {
        
        self.colusure = closure
    }

}
