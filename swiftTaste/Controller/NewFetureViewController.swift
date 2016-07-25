//
//  NewFetureViewController.swift
//  swiftTaste
//
//  Created by Liu on 16/7/8.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

private let CellReuseIdentifier = "CellReuseIdentifier"

class NewFetureViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.title = "新特性"
        
        view.backgroundColor = UIColor.lightGrayColor()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: CellReuseIdentifier)
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
        cell?.backgroundColor = MainColor()
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let index = NSString(format: "%zd",indexPath.row)
        
        clickBlock?(type: index as String)
        
        navigationController?.popViewControllerAnimated(true)
    }

    //点击block
    var clickBlock : ((type : String) -> ())?
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y;
        if (offsetY > 0) {
            if (offsetY >= 44) {
                setNavigationBarTransformProgress(1)
            } else {
                setNavigationBarTransformProgress(offsetY / 44)
            }
        } else {
            setNavigationBarTransformProgress(0)
            navigationController?.navigationBar.backIndicatorImage = UIImage.init();
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.lt_reset()
        navigationController?.navigationBar.lt_setTranslationY(0)
    }
    
    private func setNavigationBarTransformProgress(progress: CGFloat) {
        navigationController?.navigationBar.lt_setTranslationY(-44 * progress)
        navigationController?.navigationBar.lt_setElementsAlpha(1-progress)
    }
}
