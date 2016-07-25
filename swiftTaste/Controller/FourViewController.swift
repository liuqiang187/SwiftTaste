//
//  FourViewController.swift
//  swiftTaste
//
//  Created by Liu on 16/7/8.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

private let CellReuseIdentifier = "FCellReuseIdentifier"

class FourViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    private let MAXTOPBEGINE : CGFloat = 64
    private var originalHeaderImageViewFrame : CGRect = CGRectZero
    
    // MARK: - VClife
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.title = "我"
        
        view.backgroundColor = UIColor.whiteColor()
                
        navigationController?.navigationBar.lt_setBackgroundColor(UIColor.clearColor())
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: CellReuseIdentifier)
        
        setup()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.shadowImage = UIImage.init();
        scrollViewDidScroll(tableView)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.lt_reset()
    }
    
    private func setup()
    {
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        tableView.insertSubview(backImg, atIndex: 0)
        originalHeaderImageViewFrame = backImg.frame
    }
    
    // MARK: - scroolView
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let color = NavBarColor()
        let offsetY = scrollView.contentOffset.y;
        if (offsetY > MAXTOPBEGINE) {
            let alpha = min(1, 1 - ((MAXTOPBEGINE + 64 - offsetY) / 64))
            navigationController?.navigationBar.lt_setBackgroundColor(color.colorWithAlphaComponent(alpha))
        } else {
            navigationController?.navigationBar.lt_setBackgroundColor(color.colorWithAlphaComponent(0))
        }
        updateHeaderImageViewFrameWithOffsetY(offsetY)
    }
    
    func updateHeaderImageViewFrameWithOffsetY(offsetY: CGFloat)
    {
        if (offsetY > 0) {
            backImg.frame = self.originalHeaderImageViewFrame
            return
        }
        if (self.originalHeaderImageViewFrame.size.height - offsetY < 0) {
            return
        }
        let x :CGFloat = self.originalHeaderImageViewFrame.origin.x
        let y :CGFloat = self.originalHeaderImageViewFrame.origin.y + offsetY
        let width :CGFloat = self.originalHeaderImageViewFrame.size.width
        let height :CGFloat = self.originalHeaderImageViewFrame.size.height - offsetY
        backImg.frame = CGRectMake(x, y, width, height)
    }
    
    // MARK: - Table view data source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier)
        
        let index = NSString(format: "%zd",indexPath.row)
        
        cell!.textLabel?.text = "wahaha  " + (index as String)
        //        cell?.backgroundColor = MainColor()
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    // MARK: lazy
    private lazy var backImg : UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "SkyBg01")
        img.contentMode = UIViewContentMode.ScaleAspectFill
        img.frame = CGRectMake(0, 0, kScreenWidth(), 200)
        return img
    }()
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
}
