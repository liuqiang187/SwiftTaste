//
//  CommonTableViewController.swift
//  swiftTaste
//
//  Created by Liu on 16/7/21.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class CommonTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView.init()
        view.backgroundColor = DEFAULT_BACKGROUND_COLOR()
        tableView.backgroundColor = DEFAULT_BACKGROUND_COLOR()
        self.hidesBottomBarWhenPushed = true
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
}
