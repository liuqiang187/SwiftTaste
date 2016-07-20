//
//  MeTableView.swift
//  swiftTaste
//
//  Created by Liu on 16/7/20.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

private let CellReuseIdentifier = "FCellReuseIdentifier"

class MeTableView: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: CellReuseIdentifier)

    }
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 64
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier)
        
        let index = NSString(format: "%zd",indexPath.row)
        
        cell!.textLabel?.text = "wahaha  " + (index as String)
        //        cell?.backgroundColor = MainColor()
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }

}
