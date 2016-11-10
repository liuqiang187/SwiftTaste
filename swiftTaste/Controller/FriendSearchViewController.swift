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
        
        tableView.register(WXFriendCell.self, forCellReuseIdentifier: CellReuseIdentifier)
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.originY = 64
        tableView.frameHeight = kScreenHeight() - tableView.originY
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.shared.statusBarStyle = .default
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    // MARK: - UITableViewDelegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54.5
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "联系人"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier) as! WXFriendCell
        let usr = data[indexPath.row]
        cell.user = usr
        if (indexPath.row == 0) {
            cell.topLineStyle = CellLineStyle.cellLineStyleFill
        }
        else{
            cell.topLineStyle = CellLineStyle.cellLineStyleNone
        }
        if (indexPath.row == data.count - 1) {
            cell.bottomLineStyle = CellLineStyle.cellLineStyleFill
        }
        else{
            cell.bottomLineStyle = CellLineStyle.cellLineStyleDefault
        }
        return cell
    }
    
    // MARK: - UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text
        data.removeAll()
        
        for item in friendsArray {
            if ((item.userID?.contains(searchText!)) != nil) {
                data.append(item)
            }
            if ((item.username?.contains(searchText!)) != nil) {
                data.append(item)
            }
            if ((item.nikename?.contains(searchText!)) != nil) {
                data.append(item)
            }
            if ((item.pinyin?.contains(searchText!)) != nil) {
                data.append(item)
            }
            if ((item.initial?.contains(searchText!)) != nil) {
                data.append(item)
            }
        }
        tableView.reloadData()
    }
}
