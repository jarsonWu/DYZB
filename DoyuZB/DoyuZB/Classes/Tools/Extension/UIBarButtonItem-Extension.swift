//
//  UIBarButtonItem-Extension.swift
//  DoyuZB
//
//  Created by jarson on 2018/2/16.
//  Copyright © 2018年 jarson. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    /*
    class func createItem(imageName:String,highImageName:String,size:CGSize)->UIBarButtonItem{
        let btn = UIButton()
        btn.setImage(UIImage(named:imageName), for: .normal)
        btn.setImage(UIImage(named:highImageName), for: .highlighted)
        btn.frame=CGRect(origin: CGPoint.zero, size: size)
        return UIBarButtonItem(customView: btn)
    }
 */
    convenience init(imageName:String,highImageName:String="",size:CGSize=CGSize.zero){
        let btn = UIButton()
        btn.setImage(UIImage(named:imageName), for: .normal)
        
        if highImageName != nil{
            btn.setImage(UIImage(named:highImageName), for: .highlighted)
        }
        
        if size == CGSize.zero{
            btn.sizeToFit()
        }else{
            btn.frame=CGRect(origin: CGPoint.zero, size: size)
        }
        
        self.init(customView: btn)
    }
}
