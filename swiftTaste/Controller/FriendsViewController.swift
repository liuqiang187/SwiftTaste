//
//  FriendsViewController.swift
//  swiftTaste
//
//  Created by Liu on 16/7/26.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class FriendsViewController: CommonTableViewController ,UISearchBarDelegate{

    var data = [[]]
    var friendsArray = [WXUser]()
    var functionGroup = WXSettingGrounp()
    var sections = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hidesBottomBarWhenPushed = false
        navigationItem.title = "通讯录"
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.sectionIndexBackgroundColor = UIColor.clearColor()
        tableView.sectionIndexColor = NavBarColor()
        tableView.registerClass(WXFriendCell.self, forCellReuseIdentifier: "FriendCell")
        tableView.registerClass(WXFriendHeaderView.self, forHeaderFooterViewReuseIdentifier: "WXFriendHeaderView")
        tableView.separatorStyle = .None
        tableView.tableFooterView = footerLabel
        tableView.tableHeaderView = searchController.searchBar
        
        initFriendsTestData()
    }
    
    private func initFriendsTestData() -> (){
        dispatch_async(dispatch_get_global_queue(0, 0)) {
            
            self.friendsArray = WXConfigData.initFriendsTestData()
            self.data = WXConfigData.getFriendListDataBy(self.friendsArray)
            self.sections = WXConfigData.getFriendListSectionBy(self.friendsArray)
            self.functionGroup = WXConfigData.getFriendsVCItems()
            
            dispatch_async(dispatch_get_main_queue(), { 
                self.tableView.reloadData()
                self.footerLabel.text = String(self.friendsArray.count) + "位联系人"
            })
        }
    }
    
    // MARK: - UITableViewDelegate
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data.count + 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return functionGroup.items.count
        }
        let array = data[section - 1]
        return array.count
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        let view = tableView.dequeueReusableHeaderFooterViewWithIdentifier("WXFriendHeaderView") as? WXFriendHeaderView
        view!.title = sections[section - 1]
        return view
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell") as! WXFriendCell
        if (indexPath.section == 0) {
            let item = functionGroup.itemAtIndex(indexPath.row) 
            let user = WXUser()
            user.username = item.title
            user.avatarURL = item.imageName
            cell.user = user
            cell.topLineStyle = CellLineStyle.CellLineStyleNone
            if (indexPath.row == functionGroup.items.count - 1) {
                cell.bottomLineStyle = CellLineStyle.CellLineStyleNone
            }
            else{
                cell.bottomLineStyle = CellLineStyle.CellLineStyleDefault
            }
        }
        else{
            let array = data[indexPath.section - 1]
            let user = array[indexPath.row]
            cell.user = user as? WXUser
            cell.topLineStyle = CellLineStyle.CellLineStyleNone
            if (indexPath.row == array.count - 1) {
                if (indexPath.section == data.count) {
                    cell.bottomLineStyle = CellLineStyle.CellLineStyleFill
                }
                else{
                    cell.bottomLineStyle = CellLineStyle.CellLineStyleNone
                }
            }
            else{
                cell.bottomLineStyle = CellLineStyle.CellLineStyleDefault
            }
        }
        return cell
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return sections
    }
    
    override func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        if (index == 0) {
            tableView.scrollRectToVisible(searchController.searchBar.frame, animated: false)
            return -1
        }
        return index
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54.5
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 22
    }
    
    // MARK: - UISearchBarDelegate
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        searchVC.friendsArray = friendsArray
        tabBarController?.tabBar.hidden = true
    }
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        tabBarController?.tabBar.hidden = true
        return true
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        tabBarController?.tabBar.hidden = false
    }
    
    // MARK: - lazy var
    private lazy var footerLabel : UILabel = {
        let label = UILabel.init(frame: CGRectMake(0, 0, kScreenWidth(), 49))
        label.backgroundColor = UIColor.whiteColor()
        label.textColor = UIColor.grayColor()
        label.textAlignment = NSTextAlignment.Center
        return label
    }()
    
    private lazy var searchVC : FriendSearchViewController = FriendSearchViewController()
    
    private lazy var searchController : UISearchController = {
        let search = UISearchController.init(searchResultsController: self.searchVC)
        search.searchResultsUpdater = self.searchVC
        search.searchBar.placeholder = "搜索"
        search.searchBar.barTintColor = RGB(239, 244, 244)
        search.searchBar.sizeToFit()
        search.searchBar.delegate = self
        search.searchBar.layer.borderWidth = 0.5
        search.searchBar.layer.borderColor = RGB(220, 220, 200).CGColor
        return search
    }()
}
