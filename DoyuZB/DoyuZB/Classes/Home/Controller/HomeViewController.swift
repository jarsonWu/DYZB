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

    private lazy var pageTitleView : PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
//        titleView.backgroundColor = UIColor.purple
        return titleView
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
