//
//  FriendSearchViewController.swift
//  swiftTaste
//
//  Created by Liu on 16/7/26.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

private let CellReuseIdentifier = "WXFriendCell"

class FriendSearchViewController: CommonTableViewController ,UISearchResultsUpdating{

    var data = [WXUser]()
    var friendsArray = [WXUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(WXFriendCell.self, forCellReuseIdentifier: CellReuseIdentifier)
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.originY = 64
        tableView.frameHeight = kScreenHeight() - tableView.originY
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.sharedApplication().statusBarStyle = .Default
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
    // MARK: - UITableViewDelegate
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54.5
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "联系人"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier) as! WXFriendCell
        let usr = data[indexPath.row]
        cell.user = usr
        if (indexPath.row == 0) {
            cell.topLineStyle = CellLineStyle.CellLineStyleFill
        }
        else{
            cell.topLineStyle = CellLineStyle.CellLineStyleNone
        }
        if (indexPath.row == data.count - 1) {
            cell.bottomLineStyle = CellLineStyle.CellLineStyleFill
        }
        else{
            cell.bottomLineStyle = CellLineStyle.CellLineStyleDefault
        }
        return cell
    }
    
    // MARK: - UISearchResultsUpdating
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchText = searchController.searchBar.text
        data.removeAll()
        
        for item in friendsArray {
            if ((item.userID?.containsString(searchText!)) != nil) {
                data.append(item)
            }
            if ((item.username?.containsString(searchText!)) != nil) {
                data.append(item)
            }
            if ((item.nikename?.containsString(searchText!)) != nil) {
                data.append(item)
            }
            if ((item.pinyin?.containsString(searchText!)) != nil) {
                data.append(item)
            }
            if ((item.initial?.containsString(searchText!)) != nil) {
                data.append(item)
            }
        }
        tableView.reloadData()
    }
}
