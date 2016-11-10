//
//  MeDetailViewController.swift
//  swiftTaste
//
//  Created by Liu on 16/7/25.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class MeDetailViewController: WXSettingBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "个人信息"
        
        
        data = WXConfigData.getMeDetailVCItems()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0 && indexPath.row == 0) {
            return 80.0
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}
