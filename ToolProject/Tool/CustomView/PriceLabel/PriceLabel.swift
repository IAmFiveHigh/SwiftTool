//
//  PriceLabel.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/5/2.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class PriceLabel: UIView {
    var yLabel: UILabel!
    
    var price: UILabel!
    var decimals: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        yLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 8, height: 15))
        yLabel.setUI(font: 12, textColor: "FF2A00", typeface: .Medium)
        yLabel.setBottom(height())
        yLabel.text = "¥"
        addSubview(yLabel)
        
        price = UILabel(frame: CGRect(x: yLabel.right() + 0.5, y: 0, width: 10, height: 16))
        price.setUI(font: 15, textColor: "FF2A00", typeface: .Medium)
        price.setCenterY(height() / 2)
        addSubview(price)
        
        
        decimals = UILabel(frame: CGRect(x: price.right(), y: 0, width: 10, height: 15))
        decimals.setUI(font: 12, textColor: "FF2A00", typeface: .Medium)
        decimals.setBottom(height())
        addSubview(decimals)
        
        
    }
    
    func setPriceText(_ priceText: String) {
        
        let array = priceText.components(separatedBy: ".") 
        if array.count == 1 {
            
            price.text = priceText
            price.sizeToFit()
            decimals.setX(price.right())
            decimals.text = ".00"
            decimals.sizeToFit()
            decimals.setBottom(price.bottom())
            yLabel.setBottom(price.bottom())

        }else {
            
            price.text = array.first
            price.sizeToFit()
            decimals.setX(price.right())
            decimals.text = "." + array.last!
            decimals.sizeToFit()
            decimals.setBottom(price.bottom())
            yLabel.setBottom(price.bottom())
        }
    }
    
}
