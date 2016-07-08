//
//  NavigationViewController.swift
//  swiftTaste
//
//  Created by Liu on 16/7/8.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            // push的时候, 隐藏tabbar
            viewController.hidesBottomBarWhenPushed = true
            // 添加返回按钮
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_back_switch"), style: .Done, target: self, action: #selector(NavigationViewController.back))
        }
        super.pushViewController(viewController, animated: true)
        
    }
    
    func back() {
        popViewControllerAnimated(true)
    }

}
