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
        
        view.backgroundColor = UIColor.lightGray
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellReuseIdentifier)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier)
        
        let index = NSString(format: "%zd",indexPath.row)
        
        cell!.textLabel?.text = "wahaha  " + (index as String)
        cell?.backgroundColor = MainColor()
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let index = NSString(format: "%zd",indexPath.row)
        
        clickBlock?(index as String)
        
        _ = navigationController?.popViewController(animated: true)
    }

    //点击block
    var clickBlock : ((_ type : String) -> ())?
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.lt_reset()
        navigationController?.navigationBar.lt_setTranslationY(0)
    }
    
    fileprivate func setNavigationBarTransformProgress(_ progress: CGFloat) {
        navigationController?.navigationBar.lt_setTranslationY(-44 * progress)
        navigationController?.navigationBar.lt_setElementsAlpha(1-progress)
    }
}
