//
//  ViewController.swift
//  swiftTaste
//
//  Created by Liu on 16/7/8.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setup()
    }

    fileprivate func setup()
    {
        // 设置tabBar的tintColor
        tabBar.tintColor = MainColor()
        
        addViewController(FirstViewController(), title: "chat", icon: "tabbar_mainframe", iconPress: "tabbar_mainframeHL")
        addViewController(FriendsViewController(), title: "friend", icon: "tabbar_contacts", iconPress: "tabbar_contactsHL")
        addViewController(DiscoverViewController(), title: "hi", icon: "tabbar_discover", iconPress: "tabbar_discoverHL")
        addViewController(MeMainViewController(), title: "me", icon: "tabbar_me", iconPress: "tabbar_meHL")
    }
    
    // 添加子控件
    fileprivate func addViewController(_ childController: UIViewController, title: String, icon: String, iconPress: String) {
        let nav = NavigationViewController(rootViewController: childController)
        addChildViewController(nav)
        childController.tabBarItem.title = title;
        childController.tabBarItem.image = UIImage(named: icon)
        childController.tabBarItem.selectedImage = UIImage(named: iconPress)
        // 设置tabBarItem的tag, 方便判断点击
        childController.tabBarItem.tag = childViewControllers.count-1
    }
    

    deinit{
        
    }
}

