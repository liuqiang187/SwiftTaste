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
        
        tableView.register(WXUserDetailCell.self, forCellReuseIdentifier: CellReuseIdentifier)
        
        data = WXConfigData.getMeMainVCItems()
    }
    
    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count + 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        let group :WXSettingGrounp = data[section - 1] ;
        return group.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier) as! WXUserDetailCell
            cell.backgroundColor = UIColor.white
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            cell.user = WXUser()
            cell.topLineStyle = CellLineStyle.cellLineStyleFill
            cell.bottomLineStyle = CellLineStyle.cellLineStyleFill
            return cell
        }
        return super.tableView(tableView, cellForRowAt: IndexPath.init(row: indexPath.row, section: indexPath.section - 1))
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 90.0
        }
        return super.tableView(tableView, heightForRowAt: IndexPath.init(row: indexPath.row, section: indexPath.section - 1))
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (section == 0) {
            return super.tableView(tableView, heightForFooterInSection: 0)
        }
        return super.tableView(tableView, heightForFooterInSection: section - 1)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var vc : UIViewController?
        if (indexPath.section == 0 && indexPath.row == 0) {
            vc = MeDetailViewController()
            navigationController?.pushViewController(vc!, animated: true)
        }
        else{
            let group = data[indexPath.section - 1]
            let item = group.itemAtIndex(indexPath.row)
            if (item.title == "设置") {
                vc = MeSettingView()
                navigationController?.pushViewController(vc!, animated: true)
            }
        }
    }
    
    
}
