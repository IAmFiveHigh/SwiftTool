//
//  CellHeaderView.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/5/5.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class CellHeaderView: UIView {

    //width 170
    var photo: UIImageView!
    
    var name: UILabel!
    
    var time: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        photo = UIImageView()
        photo.layer.cornerRadius = 15
        photo.layer.masksToBounds = true
        addSubview(photo)
        
        name = UILabel()
        name.setUI(font: 13, textColor: "1A1A1A", typeface: .Bold)
        name.setCenterY(photo.height() / 2)
        addSubview(name)
        
        time = UILabel()
        time.setUI(font: 12, textColor: "666666", typeface: .Medium)
        time.setCenterY(photo.height() / 2)
        addSubview(time)
        
        photo.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()(self.mas_top)
            make?.left.mas_equalTo()(self.mas_left)
            make?.size.mas_equalTo()(CGSize(width: 30, height: 30))
        }
        
        name.mas_makeConstraints { (make) in
            make?.centerY.mas_equalTo()(self.photo.mas_centerY)
            make?.height.mas_equalTo()(15)
            make?.left.mas_equalTo()(self.photo.mas_right)?.with().offset()(10)
        }
        
        time.mas_makeConstraints { (make) in
            make?.centerY.mas_equalTo()(self.photo.mas_centerY)
            make?.height.mas_equalTo()(15)
            make?.left.mas_equalTo()(self.name.mas_right)?.with().offset()(10)
        }

    }

    func updateUI(with name: String, image: String, time: String, dateFormate: String) {
        
        self.photo.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "我-未选中"))
        self.name.text = name
        self.name.sizeToFit()
        self.time.text = Date.dateDistanceWithNow(time, dateformat: dateFormate)
    
    }
}
