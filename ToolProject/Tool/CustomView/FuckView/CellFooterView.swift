//
//  CellFooterView.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/5/5.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

protocol CellFooterDelegate:class {
    
    func likeButtonBeClick(model: PostCommentModel, status: String)
    
    func commentButtonBeClick(model: PostCommentModel)
}


class CellFooterView: UIView {
    //width 120
    let type: likeOrPost
    
    let closeLeft: Bool
    
    var commentNum: UILabel!
    
    var commentImage: UIImageView!
    
    var num: UILabel!
    
    var likeImage: UIImageView!
    
    var postLabel: UILabel!

    var model: PostCommentModel?
    
    var isFill : Bool = true
    
    weak var delegate: CellFooterDelegate?
    
    var status: Bool = false {
        didSet {
            
            if status {
                
                likeImage.image = UIImage(named: "帖子里-已点赞")
            }else {
                
                likeImage.image = UIImage(named: "帖子里-未点赞")
            }
        }
    }
    
    init(frame: CGRect, type: likeOrPost, closeLeft: Bool = false) {
        
        self.type = type
        
        self.closeLeft = closeLeft
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        commentNum = UILabel()
        commentNum.setUI(font: 12, textColor: "BFBFBF", typeface: .Medium)
        commentNum.setRight(width() - 15)
        addSubview(commentNum)
        
        commentImage = UIImageView()
        commentImage.image = UIImage(named: "帖子里-评论")
        commentImage.setRight(commentNum.x() - 5)
        addSubview(commentImage)
        
        num = UILabel()
        num.setUI(font: 12, textColor: "BFBFBF", typeface: .Medium)
        num.setRight(commentImage.x() - 5)
        addSubview(num)
        
        if type == .like {
            
            likeImage = UIImageView()
            likeImage.setRight(num.x() - 5)
            likeImage.image = UIImage(named: "帖子里-未点赞")
            addSubview(likeImage)
        }else if type == .post {
            
            postLabel = UILabel()
            postLabel.setUI(font: 12, textColor: "BFBFBF", typeface: .Medium)
            postLabel.setRight(num.x() - 5)
            postLabel.text = "帖子"
            addSubview(postLabel)
        }
        
        if closeLeft {
            
            
            
            if type == .like {
                likeImage.mas_makeConstraints({ (make) in
                    make?.left.equalTo()(self.mas_left)
                    make?.height.equalTo()(15)
                    make?.top.equalTo()(self.mas_top)
                    make?.width.equalTo()(15)
                })
                
                num.mas_makeConstraints { (make) in
                    make?.left.equalTo()(self.likeImage.mas_right)?.with().offset()(5)
                    make?.height.equalTo()(15)
                    make?.top.equalTo()(self.mas_top)
                }
            }else {
                
                postLabel.mas_makeConstraints({ (make) in
                    make?.left.equalTo()(self.mas_left)
                    make?.height.equalTo()(15)
                    make?.top.equalTo()(self.mas_top)
                })
                
                num.mas_makeConstraints { (make) in
                    make?.left.equalTo()(self.postLabel.mas_right)?.with().offset()(5)
                    make?.height.equalTo()(15)
                    make?.top.equalTo()(self.mas_top)
                }
            }
            
            commentImage.mas_makeConstraints { (make) in
                make?.left.equalTo()(self.num.mas_right)?.with().offset()(15)
                make?.height.equalTo()(15)
                make?.top.equalTo()(self.mas_top)
                make?.width.equalTo()(15)
            }
            
            commentNum.mas_makeConstraints { (make) in
                make?.left.equalTo()(self.commentNum.mas_right)?.with().offset()(5)
                make?.height.equalTo()(15)
                make?.top.equalTo()(self.mas_top)
            }
            
           
            
            
        }else {
            
            commentNum.mas_makeConstraints { (make) in
                make?.right.equalTo()(self.mas_right)?.with().offset()(-15)
                make?.height.equalTo()(15)
                make?.top.equalTo()(self.mas_top)
            }
            
            commentImage.mas_makeConstraints { (make) in
                make?.right.equalTo()(self.commentNum.mas_left)?.with().offset()(-5)
                make?.height.equalTo()(15)
                make?.top.equalTo()(self.mas_top)
                make?.width.equalTo()(15)
            }
            
            num.mas_makeConstraints { (make) in
                make?.right.equalTo()(self.commentImage.mas_left)?.with().offset()(-15)
                make?.height.equalTo()(15)
                make?.top.equalTo()(self.mas_top)
            }
            
            if type == .like {
                likeImage.mas_makeConstraints({ (make) in
                    make?.right.equalTo()(self.num.mas_left)?.with().offset()(-5)
                    make?.height.equalTo()(15)
                    make?.top.equalTo()(self.mas_top)
                    make?.width.equalTo()(15)
                })
            }else {
                
                postLabel.mas_makeConstraints({ (make) in
                    make?.right.equalTo()(self.num.mas_left)?.with().offset()(-5)
                    make?.height.equalTo()(15)
                    make?.top.equalTo()(self.mas_top)
                })
            }
        }
    }
    
    func updateUI(with commentNumber: String, num: String) {
        
        self.commentNum.text = commentNumber
        self.num.text = num
        
        self.commentNum.sizeToFit()
        self.num.sizeToFit()
        
        if isFill {
            
            commentImage.image = UIImage(named: "直播-标题处评论数量")
            
            if type == .like {
                
                likeImage.image = UIImage(named: "点赞数量")
            }
        }
    }
    
    func newViews(_ view:String) {
        
        self.num.text = view
        
        self.num.sizeToFit()

    }
    
    func newComment(_ comment: String) {
        
        self.commentNum.text = comment
        
        self.commentNum.sizeToFit()

    }
    
    func updateWithModel(_ model: PostCommentModel) {
        
        self.status = model.ZAN == "1" ? true : false
        
        self.model = model
        
        self.commentNum.text = ""
        self.num.text = model.VIEWS
        
        self.commentNum.sizeToFit()
        self.num.sizeToFit()
    }
    
    

}
enum likeOrPost {
    case like
    case post
}
