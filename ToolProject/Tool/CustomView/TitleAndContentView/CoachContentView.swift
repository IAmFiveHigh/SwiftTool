//
//  CoachContentView.swift
//  优快学车Boss
//
//  Created by 我是五高你敢信 on 2017/1/11.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

protocol CoachContentViewDelegate: class {
    
    func coachContentView(_ contentView: CoachContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int)
}

private let contentCellID = "contentCellID"

class CoachContentView: UIView {

    fileprivate var childVCs: [UIViewController]
    fileprivate weak var parentViewController: UIViewController?
    fileprivate var startOffsetX: CGFloat = 0
    fileprivate var isForbidScrollDelegate: Bool = false
    
    weak var delegate: CoachContentViewDelegate?
    
    fileprivate lazy var collectionView: UICollectionView = { [weak self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: contentCellID)
        return collectionView
    }()
    
    //MARK: 自定义构造函数
    init(frame: CGRect, childVCs: [UIViewController], parentViewController: UIViewController?) {
        self.childVCs = childVCs
        self.parentViewController = parentViewController
        
        super.init(frame: frame)
        
        // 设置界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CoachContentView {
    
    fileprivate func setupUI() {
        
        // 将控制器都装到父类控制器里
        for controller in childVCs {
            parentViewController?.addChildViewController(controller)
        }
        
        // 添加collectionView
        collectionView.frame = CGRect(x: 0, y: 0, width: width(), height: height())
        addSubview(collectionView)
    }
}

extension CoachContentView: UICollectionViewDataSource {
    
    //MARK: - collectionViewDataSource协议方法
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVCs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentCellID, for: indexPath)
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
    
        let childVC = childVCs[indexPath.row]
        childVC.view.frame = cell.contentView.frame
        
        cell.contentView.addSubview(childVC.view)
        
        return cell
    }
}

extension CoachContentView: UICollectionViewDelegate {
    
    //MARK: - collectionViewDelegate协议方法
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        isForbidScrollDelegate = false
        startOffsetX = scrollView.contentOffset.x
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 0.判断是否是点击事件
        if isForbidScrollDelegate { return }
        
        // 1.定义需要获取的数据
        var progress : CGFloat = 0
        var sourceIndex : Int = 0
        var targetIndex : Int = 0
        
        // 2.判断是左滑动还是右滑动
        let currentOffsetX : CGFloat = scrollView.contentOffset.x
        let scrollViewW = scrollView.frame.width
        if currentOffsetX > startOffsetX { // 左滑动
            // 1.计算progress
            progress = currentOffsetX / scrollViewW - floor(currentOffsetX / scrollViewW)
            
            // 2.计算sourceIndex
            sourceIndex = Int(currentOffsetX / scrollViewW)
            
            // 3.计算targetIndex
            targetIndex = sourceIndex + 1
            if targetIndex >= childVCs.count {
                targetIndex = childVCs.count - 1
            }
            
            // 4.如果完全划过去
            if currentOffsetX - startOffsetX == scrollViewW {
                progress = 1.0
                targetIndex = sourceIndex
            }
        } else { // 右滑动
            // 1.计算progres  s
            progress = 1 - (currentOffsetX / scrollViewW - floor(currentOffsetX / scrollViewW))
            
            // 2.计算targetIndex
            targetIndex = Int(currentOffsetX / scrollViewW)
            
            // 3.计算sourceIndex
            sourceIndex = targetIndex + 1
            if sourceIndex >= childVCs.count {
                sourceIndex = childVCs.count - 1
            }
            
            // 4.如果完全划过去
            if startOffsetX - currentOffsetX == scrollViewW {
                progress = 1.0
                sourceIndex = targetIndex
            }
        }

        delegate?.coachContentView(self, progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
    
}

// MARK:- 对外暴露的方法
extension CoachContentView {
    func setCurrentIndex(_ currentIndex : Int) {
        // 0.记录需要禁止的代理方法
        isForbidScrollDelegate = true
        
        // 1.计算偏移量
        let offsetX = CGFloat(currentIndex) * collectionView.frame.width
        
        // 2.设置collectionView的偏移位置
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: false)
    }
}
