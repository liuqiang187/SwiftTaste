//
//  WXSettingBaseViewController.swift
//  swiftTaste
//
//  Created by Liu on 16/7/21.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class WXSettingBaseViewController: CommonTableViewController {

    var data = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView.init(frame: view.bounds, style: .Grouped)
        tableView.tableFooterView = UIView.init(frame: CGRectMake(0, 0, 0, 20))
        tableView.registerClass(WXSettingCell.self, forCellReuseIdentifier: "WXSettingCell")
        tableView.registerClass(WXSettingHeaderFooteFView.self, forHeaderFooterViewReuseIdentifier: "WXSettingHeaderFooteFView")
        tableView.separatorStyle = .None
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group :WXSettingGrounp = data[section] as! WXSettingGrounp;
        return group.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let group :WXSettingGrounp = data[indexPath.section] as! WXSettingGrounp;
        let item = group.itemAtIndex(indexPath.row)
        let cell = tableView.dequeueReusableCellWithIdentifier("WXSettingCell") as! WXSettingCell
        cell.item = item
        
        if item.type != .WXSettingItemTypeButton {
            if indexPath.row == 0 {
                cell.topLineStyle = CellLineStyle.CellLineStyleFill
            }
            else{
                cell.topLineStyle = CellLineStyle.CellLineStyleNone
            }
            
            if indexPath.row == group.items.count - 1{
                cell.bottomLineStyle = CellLineStyle.CellLineStyleFill
            }
            else{
                cell.bottomLineStyle = CellLineStyle.CellLineStyleDefault
            }
        }
        else{
            cell.topLineStyle = CellLineStyle.CellLineStyleNone
            cell.bottomLineStyle = CellLineStyle.CellLineStyleNone
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterViewWithIdentifier("WXSettingHeaderFooteFView") as! WXSettingHeaderFooteFView
        if data.count > section {
            let group :WXSettingGrounp = data[section] as! WXSettingGrounp;
            view.text = group.headerTitle
        }
        return view
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterViewWithIdentifier("WXSettingHeaderFooteFView") as! WXSettingHeaderFooteFView
        if data.count > section {
            let group :WXSettingGrounp = data[section] as! WXSettingGrounp;
            view.text = group.footerTitle
        }
        return view
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if data.count > indexPath.section {
            let group :WXSettingGrounp = data[indexPath.section] as! WXSettingGrounp;
            let item = group.itemAtIndex(indexPath.row)
            return WXSettingCell.getHeightForText(item)
        }
        return 0.0
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if data.count > section {
            let group :WXSettingGrounp = data[section] as! WXSettingGrounp;
            if group.headerTitle.isEmpty {
                return section == 0 ? 15 : 10
            }
            return WXSettingHeaderFooteFView.getHeightForText(group.headerTitle)
        }
        return 10
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if data.count > section {
            let group :WXSettingGrounp = data[section] as! WXSettingGrounp;
            if group.headerTitle.isEmpty {
                return section == data.count - 1 ? 30 : 10
            }
            return WXSettingHeaderFooteFView.getHeightForText(group.footerTitle)
        }
        return 10
    }
    
    // MARK: - lazy var
    
}
