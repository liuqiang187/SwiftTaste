//
//  MeMainViewController.swift
//  swiftTaste
//
//  Created by Liu on 16/7/25.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

private let CellReuseIdentifier = "MeMainReuseIdentifier"

class MeMainViewController: WXSettingBaseViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hidesBottomBarWhenPushed = false
        
        navigationItem.title = "我"
        
        tableView.registerClass(WXUserDetailCell.self, forCellReuseIdentifier: CellReuseIdentifier)
        
        data = WXConfigData.getMeMainVCItems()
    }
    
    // MARK: - UITableViewDataSource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data.count + 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        let group :WXSettingGrounp = data[section - 1] as! WXSettingGrounp;
        return group.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier) as! WXUserDetailCell
            cell.backgroundColor = UIColor.whiteColor()
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell.user = WXUser()
            cell.topLineStyle = CellLineStyle.CellLineStyleFill
            cell.bottomLineStyle = CellLineStyle.CellLineStyleFill
            return cell
        }
        return super.tableView(tableView, cellForRowAtIndexPath: NSIndexPath.init(forRow: indexPath.row, inSection: indexPath.section - 1))
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 90.0
        }
        return super.tableView(tableView, heightForRowAtIndexPath: NSIndexPath.init(forRow: indexPath.row, inSection: indexPath.section - 1))
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (section == 0) {
            return super.tableView(tableView, heightForFooterInSection: 0)
        }
        return super.tableView(tableView, heightForFooterInSection: section - 1)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var vc : UIViewController?
        if (indexPath.section == 0 && indexPath.row == 0) {
            vc = MeDetailViewController()
            navigationController?.pushViewController(vc!, animated: true)
        }
        else{
            let group = data.objectAtIndex(indexPath.section - 1) as! WXSettingGrounp
            let item = group.itemAtIndex(indexPath.row)
            if (item.title == "设置") {
                vc = MeSettingView()
                navigationController?.pushViewController(vc!, animated: true)
            }
        }
    }
    
    
}
