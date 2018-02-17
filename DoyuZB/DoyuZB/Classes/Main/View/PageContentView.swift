//
//  PageContentView.swift
//  DoyuZB
//
//  Created by jarson on 2018/2/17.
//  Copyright © 2018年 jarson. All rights reserved.
//

import UIKit

private let ContentCellID = "ContentCellID"
class PageContentView: UIView {

    private var childVcs : [UIViewController]
    private var parentViewController : UIViewController
    
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ContentCellID)
        return collectionView
    }()
    init(frame: CGRect,childVcs: [UIViewController],parentViewController:UIViewController) {
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        super.init(frame : frame)
        
        //设置UI
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//Mark:-设置UI界面
extension PageContentView{
    private func setupUI(){
        for childVc in childVcs{
            parentViewController.addChildViewController(childVc)
        }
        
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}

//Mark:-遵守UICollectionView的DataSource
extension PageContentView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCellID, for: indexPath)
        
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        let childVc = childVcs[indexPath.item]
        childVc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVc.view)
        return cell
    }
    
    
}
