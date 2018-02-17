
//
//  UIColor-Extension.swift
//  DoyuZB
//
//  Created by jarson on 2018/2/17.
//  Copyright © 2018年 jarson. All rights reserved.
//

import UIKit

extension UIColor{
    convenience init(r:CGFloat,g:CGFloat,b:CGFloat){
        self.init(red: r/255.0,green: g/255.0,blue: b/255.0,alpha: 1.0 )
        
    }
}
