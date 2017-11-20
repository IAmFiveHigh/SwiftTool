//
//  Bottom帖子操作栏.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/11/20.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

protocol Bottom操作栏ClickDelegate: class {
    
    func click(type: Bottom操作栏.Bottom操作栏点击事件, sender: UIButton)
}

class Bottom操作栏: UIView {

    enum Bottom操作栏点击事件 {
        case 评论
        case 点赞
        case 收藏
        case 分享
    }
    
    fileprivate var clickType: Bottom操作栏点击事件 = .评论
    fileprivate let 添加收藏: Bool
    
    fileprivate var btn评论: UIButton!
    fileprivate var btn评论数: UILabel!
    fileprivate var btn点赞: UIButton!
    fileprivate var btn收藏: UIButton!
    fileprivate var btn分享: UIButton!
    
    fileprivate var 赞label: UILabel!
    
    var 赞数: Int = 0 {
        didSet {
            赞label.text = "\(赞数)"
            if 赞数 > 0 {
                赞label.isHidden = false
            }else {
                赞label.isHidden = true
            }
        }
    }
    
    var 评论数: Int = 0 {
        didSet {
            if 评论数 == 0 {
                btn评论数.text = "暂无评论,快来评论啦"
            }else {
                btn评论数.text = "已有\(评论数)条评论,我也来说两句"
            }
        }
    }
    

    weak var delegate: Bottom操作栏ClickDelegate?
    
    fileprivate var btnWidth: CGFloat {
        get {
            if 添加收藏 {
                return screenWidth * 0.45 / 3
            }else {
                return screenWidth * 0.45 / 2
            }
        }
    }
    
    init(frame: CGRect, 有收藏: Bool) {
        
        self.添加收藏 = 有收藏
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        
        backgroundColor = UIColor(hexColor: "FFFFFF")
        
        let line = UIView()
        line.backgroundColor = UIColor(hexColor: "DBDBDB")
        addSubview(line)
        
        line.mas_makeConstraints { (make) in
            make?.left.and().right().and().top().equalTo()(self)
            make?.height.equalTo()(0.5)
        }
        
        let view椭圆底色 = UIView()
        view椭圆底色.backgroundColor = UIColor(hexColor: "F0F0F0")
        view椭圆底色.layer.cornerRadius = 15
        view椭圆底色.layer.masksToBounds = true
        view椭圆底色.layer.borderColor = UIColor(hexColor: "E0E0E0").cgColor
        view椭圆底色.layer.borderWidth = 1
        addSubview(view椭圆底色)
        
        view椭圆底色.mas_makeConstraints { (make) in
            make?.left.equalTo()(self.mas_left)?.with().offset()(16)
            make?.top.equalTo()(self.mas_top)?.with().offset()(9)
            make?.bottom.equalTo()(self.mas_bottom)?.with().offset()(-9)
            make?.width.equalTo()(screenWidth * 0.5056)
        }
        
        view椭圆底色.setContentHuggingPriority(UILayoutPriorityDefaultLow, for: .horizontal)
        view椭圆底色.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, for: .horizontal)
        
        btn评论数 = UILabel()
        btn评论数.setUI(font: 12, textColor: "404040")
        addSubview(btn评论数)
        
        btn评论数.mas_makeConstraints { (make) in
            make?.left.equalTo()(view椭圆底色.mas_left)?.with().offset()(12)
            make?.right.equalTo()(view椭圆底色.mas_right)?.with().offset()(-12)
            make?.top.and().bottom().equalTo()(view椭圆底色)
        }
        
        btn评论 = UIButton()
        btn评论.addTarget(self, action: #selector(评论))
        addSubview(btn评论)
        
        btn评论.mas_makeConstraints { (make) in
            make?.left.and().right().and().bottom().and().top().equalTo()(view椭圆底色)
        }
        
        btn点赞 = UIButton()
        btn点赞.setImage(UIImage(named: "帖子详情-底部操作栏-未点赞"), for: .normal)
        btn点赞.setImage(UIImage(named: "帖子详情-底部操作栏-已点赞"), for: .selected)
        btn点赞.addTarget(self, action: #selector(点赞))
        addSubview(btn点赞)
        
        btn点赞.mas_makeConstraints { (make) in
            make?.left.equalTo()(view椭圆底色.mas_right)
            make?.top.and().bottom().equalTo()(self)
            make?.width.equalTo()(self.btnWidth)
        }
        
        赞label = UILabel()
        赞label.setUI(font: 9, textColor: "000000")
        赞label.isHidden = true
        赞label.textAlignment = .center
        赞label.backgroundColor = UIColor.white
        btn点赞.addSubview(赞label)
        
        赞label.mas_makeConstraints { (make) in
            make?.left.equalTo()(self.btn点赞.imageView?.mas_right)?.with().offset()(-4)
            make?.size.equalTo()(CGSize(width: 16, height: 10))
            make?.top.equalTo()(self.btn点赞.imageView?.mas_top)?.with().offset()(-6)
        }
        
        btn分享 = UIButton()
        btn分享.setImage(UIImage(named: "帖子详情-底部操作栏-分享"), for: .normal)
        btn分享.addTarget(self, action: #selector(分享))
        addSubview(btn分享)
        
        if 添加收藏 {
            btn收藏 = UIButton()
            btn收藏.setImage(UIImage(named: "问答详情-底部操作栏-未关注"), for: .normal)
            btn收藏.setImage(UIImage(named: "问答详情-底部操作栏-已关注"), for: .selected)
            btn收藏.addTarget(self, action: #selector(收藏))
            addSubview(btn收藏)
            
            btn收藏.mas_makeConstraints { (make) in
                make?.top.and().bottom().equalTo()(self.btn点赞)
                make?.width.equalTo()(self.btnWidth)
                make?.left.equalTo()(self.btn点赞.mas_right)
            }
            
            btn分享.mas_makeConstraints { (make) in
                make?.top.and().bottom().equalTo()(self.btn点赞)
                make?.width.equalTo()(self.btnWidth)
                make?.right.equalTo()(self)
            }

        }else {
            
            btn分享.mas_makeConstraints { (make) in
                make?.top.and().bottom().equalTo()(self.btn点赞)
                make?.right.equalTo()(self)
                make?.width.equalTo()(self.btnWidth)

            }
        }
        
    }
    
    func updateBtn(赞: Bool, 收藏: Bool) {
        
        if 添加收藏 {
            btn收藏.isSelected = 收藏
        }
        
        btn点赞.isSelected = 赞
    }
    
    @objc private func 评论() {
        if let delegate = delegate {
            delegate.click(type: .评论, sender: self.btn评论)
        }
    }
    
    @objc private func 点赞() {
        if let delegate = delegate {
            delegate.click(type: .点赞, sender: self.btn点赞)
        }
    }
    
    @objc private func 收藏() {
        if let delegate = delegate {
            delegate.click(type: .收藏, sender: self.btn收藏)
        }
    }
    
    @objc private func 分享() {
        if let delegate = delegate {
            delegate.click(type: .分享, sender: self.btn分享)
        }
    }
    
    

}
