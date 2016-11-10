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
        tableView.backgroundColor = UIColor.white
        tableView.sectionIndexBackgroundColor = UIColor.clear
        tableView.sectionIndexColor = NavBarColor()
        tableView.register(WXFriendCell.self, forCellReuseIdentifier: "FriendCell")
        tableView.register(WXFriendHeaderView.self, forHeaderFooterViewReuseIdentifier: "WXFriendHeaderView")
        tableView.separatorStyle = .none
        tableView.tableFooterView = footerLabel
        tableView.tableHeaderView = searchController.searchBar
        
        initFriendsTestData()
    }
    
    fileprivate func initFriendsTestData() -> (){
        DispatchQueue.global(qos: .background).async {
            
            self.friendsArray = WXConfigData.initFriendsTestData()
            self.data = WXConfigData.getFriendListDataBy(self.friendsArray)
            self.sections = WXConfigData.getFriendListSectionBy(self.friendsArray)
            self.functionGroup = WXConfigData.getFriendsVCItems()
            
            DispatchQueue.main.async(execute: { 
                self.tableView.reloadData()
                self.footerLabel.text = String(self.friendsArray.count) + "位联系人"
            })
        }
    }
    
    // MARK: - UITableViewDelegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count + 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return functionGroup.items.count
        }
        let array = data[section - 1]
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        if sections.isEmpty {
            return nil
        }
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "WXFriendHeaderView") as? WXFriendHeaderView
        view!.title = sections[section-1]
        return view
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as! WXFriendCell
        if (indexPath.section == 0) {
            let item = functionGroup.itemAtIndex(indexPath.row) 
            let user = WXUser()
            user.username = item.title
            user.avatarURL = item.imageName
            cell.user = user
            cell.topLineStyle = CellLineStyle.cellLineStyleNone
            if (indexPath.row == functionGroup.items.count - 1) {
                cell.bottomLineStyle = CellLineStyle.cellLineStyleNone
            }
            else{
                cell.bottomLineStyle = CellLineStyle.cellLineStyleDefault
            }
        }
        else{
            let array = data[indexPath.section - 1]
            let user = array[indexPath.row]
            cell.user = user as? WXUser
            cell.topLineStyle = CellLineStyle.cellLineStyleNone
            if (indexPath.row == array.count - 1) {
                if (indexPath.section == data.count) {
                    cell.bottomLineStyle = CellLineStyle.cellLineStyleFill
                }
                else{
                    cell.bottomLineStyle = CellLineStyle.cellLineStyleNone
                }
            }
            else{
                cell.bottomLineStyle = CellLineStyle.cellLineStyleDefault
            }
        }
        return cell
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        if (index == 0) {
            tableView.scrollRectToVisible(searchController.searchBar.frame, animated: false)
            return -1
        }
        return index
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54.5
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 22
    }
    
    // MARK: - UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchVC.friendsArray = friendsArray
        tabBarController?.tabBar.isHidden = true
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        tabBarController?.tabBar.isHidden = true
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        tabBarController?.tabBar.isHidden = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - lazy var
    fileprivate lazy var footerLabel : UILabel = {
        let label = UILabel.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth(), height: 49))
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.gray
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    fileprivate lazy var searchVC : FriendSearchViewController = FriendSearchViewController()
    
    fileprivate lazy var searchController : UISearchController = {
        let search = UISearchController.init(searchResultsController: self.searchVC)
        search.searchResultsUpdater = self.searchVC
        search.searchBar.placeholder = "搜索"
        search.searchBar.barTintColor = RGB(239, 244, 244)
        search.searchBar.sizeToFit()
        search.searchBar.delegate = self
        search.searchBar.layer.borderWidth = 0.5
        search.searchBar.layer.borderColor = RGB(220, 220, 200).cgColor
        return search
    }()
}
