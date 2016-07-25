//
//  MeTableView.swift
//  swiftTaste
//
//  Created by Liu on 16/7/20.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class MeSettingView: WXSettingBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "设置"
        
        data = getSettingVCItems()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }

    func getSettingVCItems() -> [WXSettingGrounp] {
        var items = [WXSettingGrounp]()
        
        let safe = WXSettingItem.createWithImageName(nil, title: "账号和安全", middleImageName: "ProfileLockOn_17x17_", subTitle: "已保护")
        let group1 = WXSettingGrounp()
        group1.items = [safe]
        items.append(group1)
        
        let noti = WXSettingItem.createWithTitle("新消息通知")
        let privacy = WXSettingItem.createWithTitle("隐私")
        let normal = WXSettingItem.createWithTitle("通用")
        let group2 = WXSettingGrounp()
        group2.items = [noti,privacy,normal]
        items.append(group2)
        
        let feedBack = WXSettingItem.createWithTitle("帮助与反馈")
        let about = WXSettingItem.createWithTitle("关于微信")
        let group3 = WXSettingGrounp()
        group3.items = [feedBack,about]
        items.append(group3)
        
        let exit = WXSettingItem.createWithTitle("退出登陆")
        exit.alignment = WXSettingItemAlignment.WXSettingItemAlignmentMiddle
        let group4 = WXSettingGrounp()
        group4.items = [exit]
        items.append(group4)
        
        return items
    }
}
