//
//  FourViewController.swift
//  swiftTaste
//
//  Created by Liu on 16/7/8.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

private let CellReuseIdentifier = "FCellReuseIdentifier"

class FourViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.title = "我"
        
        view.backgroundColor = RGB(220, G: 84, B: 75)
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: CellReuseIdentifier)
        
        navigationController?.navigationBar.lt_setBackgroundColor(UIColor.clearColor())
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
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
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let color = RGB(0, G: 175, B: 240)
        
        let offsetY = scrollView.contentOffset.y;
        if (offsetY > 50) {
            let alpha = min(1, 1 - ((50 + 64 - offsetY) / 64))
            navigationController?.navigationBar.lt_setBackgroundColor(color.colorWithAlphaComponent(alpha))
        } else {
            navigationController?.navigationBar.lt_setBackgroundColor(color.colorWithAlphaComponent(0))
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.shadowImage = UIImage.init();
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.lt_reset()
    }
    
}
