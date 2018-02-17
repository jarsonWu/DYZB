//
//  PageTitleView.swift
//  DoyuZB
//
//  Created by jarson on 2018/2/17.
//  Copyright © 2018年 jarson. All rights reserved.
//

import UIKit

private let KScorllLineH : CGFloat = 2
class PageTitleView: UIView {
    
    private var titles : [String]
    
    private lazy var titleLabels : [UILabel] = [UILabel]()
    private lazy var scrollView : UIScrollView = {
        let scorllView = UIScrollView()
        scorllView.showsHorizontalScrollIndicator = false
        scorllView.scrollsToTop = false
        scorllView.bounces = false
        scorllView.contentInsetAdjustmentBehavior = .never
        return scorllView
    }()
    
    private lazy var scollLine : UIView = {
       let scollLine = UIView()
        scollLine.backgroundColor = UIColor.orange
        return scollLine
    }()
    
    init(frame:CGRect,titles:[String]) {
        self.titles=titles
        super.init(frame:frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageTitleView{
    private func setupUI(){
        addSubview(scrollView)
        scrollView.frame = bounds
        
        setupTitleLabels()
        
        setupBottomLineAndScrollLine()
        
    }
    private func setupTitleLabels(){
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - KScorllLineH
        let labelY : CGFloat = 0
        
        for(index,title) in titles.enumerated(){
            let label = UILabel()
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
            let labelX : CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            scrollView.addSubview(label)
            
            titleLabels.append(label)
        }
    }

    private func setupBottomLineAndScrollLine(){
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        guard let firstLabel = titleLabels.first else {
            return
        }
        firstLabel.textColor = UIColor.orange
        scrollView.addSubview(scollLine)
        scollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - KScorllLineH, width: firstLabel.frame.width, height: KScorllLineH)
    }
}
