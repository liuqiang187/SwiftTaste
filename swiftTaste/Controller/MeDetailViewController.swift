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
        
        
        data = getSettingVCItems()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (indexPath.section == 0 && indexPath.row == 0) {
            return 80.0
        }
        return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    
    func getSettingVCItems() -> [WXSettingGrounp] {
        var items = [WXSettingGrounp]()
        
        let avatar = WXSettingItem.createWithImageName(nil, title: "头像", subTitle: nil, rightImageName: "dice_Action_0")
        let name = WXSettingItem.createWithTitle("名字", subTitle: "迈克学_")
        let num = WXSettingItem.createWithTitle("微信号", subTitle: "liuqiang")
        let code = WXSettingItem.createWithTitle("我的二维码")
        let address = WXSettingItem.createWithTitle("我的地址")
        let group1 = WXSettingGrounp()
        group1.items = [avatar,name,num,code,address]
        items.append(group1)
        
        let sex = WXSettingItem.createWithTitle("性别", subTitle:"男")
        let pos = WXSettingItem.createWithTitle("地址", subTitle:"内蒙古 呼和浩特")
        let proverbs = WXSettingItem.createWithTitle("个性签名", subTitle:"memedais")
        let group2 = WXSettingGrounp()
        group2.items = [sex,pos,proverbs]
        items.append(group2)
        
        return items
    }
}
