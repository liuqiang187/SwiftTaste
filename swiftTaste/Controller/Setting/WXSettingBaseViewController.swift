//
//  WXSettingBaseViewController.swift
//  swiftTaste
//
//  Created by Liu on 16/7/21.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class WXSettingBaseViewController: CommonTableViewController {

    var data = [WXSettingGrounp]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView.init(frame: view.bounds, style: .grouped)
        tableView.tableFooterView = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 20))
        tableView.register(WXSettingCell.self, forCellReuseIdentifier: "WXSettingCell")
        tableView.register(WXSettingHeaderFooteFView.self, forHeaderFooterViewReuseIdentifier: "WXSettingHeaderFooteFView")
        tableView.separatorStyle = .none
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group :WXSettingGrounp = data[section] ;
        return group.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let group :WXSettingGrounp = data[indexPath.section] ;
        let item = group.itemAtIndex(indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "WXSettingCell") as! WXSettingCell
        cell.item = item
        
        if item.type != .wxSettingItemTypeButton {
            if indexPath.row == 0 {
                cell.topLineStyle = CellLineStyle.cellLineStyleFill
            }
            else{
                cell.topLineStyle = CellLineStyle.cellLineStyleNone
            }
            
            if indexPath.row == group.items.count - 1{
                cell.bottomLineStyle = CellLineStyle.cellLineStyleFill
            }
            else{
                cell.bottomLineStyle = CellLineStyle.cellLineStyleDefault
            }
        }
        else{
            cell.topLineStyle = CellLineStyle.cellLineStyleNone
            cell.bottomLineStyle = CellLineStyle.cellLineStyleNone
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "WXSettingHeaderFooteFView") as! WXSettingHeaderFooteFView
        if data.count > section {
            let group :WXSettingGrounp = data[section] ;
            view.text = group.headerTitle
        }
        return view
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "WXSettingHeaderFooteFView") as! WXSettingHeaderFooteFView
        if data.count > section {
            let group :WXSettingGrounp = data[section] ;
            view.text = group.footerTitle
        }
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if data.count > indexPath.section {
            let group :WXSettingGrounp = data[indexPath.section] ;
            let item = group.itemAtIndex(indexPath.row)
            return WXSettingCell.getHeightForText(item)
        }
        return 0.0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if data.count > section {
            let group :WXSettingGrounp = data[section] ;
            if group.headerTitle.isEmpty {
                return section == 0 ? 15 : 10
            }
            return WXSettingHeaderFooteFView.getHeightForText(group.headerTitle)
        }
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if data.count > section {
            let group :WXSettingGrounp = data[section] ;
            if group.headerTitle.isEmpty {
                return section == data.count - 1 ? 30 : 10
            }
            return WXSettingHeaderFooteFView.getHeightForText(group.footerTitle)
        }
        return 10
    }
    
    // MARK: - lazy var
    
}
