//
//  MainViewController.swift
//  DoyuZB
//
//  Created by jarson on 2018/2/15.
//  Copyright © 2018年 jarson. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addchildVc(storyName: "Home")
        addchildVc(storyName: "Live")
        addchildVc(storyName: "Follow")
        addchildVc(storyName: "Profile")
    }

    private func addchildVc(storyName:String){
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        addChildViewController(childVc)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
