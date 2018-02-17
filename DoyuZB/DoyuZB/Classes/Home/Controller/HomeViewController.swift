//
//  HomeViewController.swift
//  DoyuZB
//
//  Created by jarson on 2018/2/16.
//  Copyright © 2018年 jarson. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40
class HomeViewController: UIViewController {

    private lazy var pageTitleView : PageTitleView = {[weak self] in
         let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
    }()
    
    private lazy var pageContentView : PageContentView = {[weak self] in
        let contentH = kScreenH-kStatusBarH-kNavigationBarH-kTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusBarH+kNavigationBarH+kTitleViewH, width: kScreenW, height: contentH)
        
        var childVcs = [UIViewController]()
        for _ in 0..<4{
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置UI界面
        setupUI()
    }

}

//Mark:- 设置UI界面
extension HomeViewController{
    private func setupUI(){
        
        setupNavigationBar()
        
        view.addSubview(pageTitleView )
        
        view.addSubview(pageContentView)
        
        pageContentView.backgroundColor = UIColor.purple
        
    }
    
    private func setupNavigationBar(){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        let size = CGSize(width: 40, height: 40)

        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems=[historyItem,searchItem,qrcodeItem]
    }
}

extension HomeViewController : PageTitleViewDelegate{
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
}
