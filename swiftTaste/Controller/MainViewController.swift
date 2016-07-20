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

    private func setup()
    {
        // 设置tabBar的tintColor
        tabBar.tintColor = MainColor()
        
        addViewController(FirstViewController(), title: "chat", icon: "tabbar_mainframe", iconPress: "tabbar_mainframeHL")
        addViewController(SecondViewController(), title: "friend", icon: "tabbar_contacts", iconPress: "tabbar_contactsHL")
        addViewController(ThirdViewController(), title: "hi", icon: "tabbar_discover", iconPress: "tabbar_discoverHL")
        addViewController(FourViewController(), title: "me", icon: "tabbar_me", iconPress: "tabbar_meHL")
    }
    
    // 添加子控件
    private func addViewController(childController: UIViewController, title: String, icon: String, iconPress: String) {
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

