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

    
    fileprivate let MAXTOPBEGINE : CGFloat = 64
    fileprivate var originalHeaderImageViewFrame : CGRect = CGRect.zero
    
    // MARK: - VClife
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.title = "我"
        
        view.backgroundColor = UIColor.white
                
        navigationController?.navigationBar.lt_setBackgroundColor(UIColor.clear)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellReuseIdentifier)
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.shadowImage = UIImage.init();
        scrollViewDidScroll(tableView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.lt_reset()
    }
    
    fileprivate func setup()
    {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        tableView.insertSubview(backImg, at: 0)
        originalHeaderImageViewFrame = backImg.frame
    }
    
    // MARK: - scroolView
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let color = NavBarColor()
        let offsetY = scrollView.contentOffset.y;
        if (offsetY > MAXTOPBEGINE) {
            let alpha = min(1, 1 - ((MAXTOPBEGINE + 64 - offsetY) / 64))
            navigationController?.navigationBar.lt_setBackgroundColor(color.withAlphaComponent(alpha))
        } else {
            navigationController?.navigationBar.lt_setBackgroundColor(color.withAlphaComponent(0))
        }
        updateHeaderImageViewFrameWithOffsetY(offsetY)
    }
    
    func updateHeaderImageViewFrameWithOffsetY(_ offsetY: CGFloat)
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
        backImg.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier)
        
        let index = NSString(format: "%zd",indexPath.row)
        
        cell!.textLabel?.text = "wahaha  " + (index as String)
        //        cell?.backgroundColor = MainColor()
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK: lazy
    fileprivate lazy var backImg : UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "SkyBg01")
        img.contentMode = UIViewContentMode.scaleAspectFill
        img.frame = CGRect(x: 0, y: 0, width: kScreenWidth(), height: 200)
        return img
    }()
    
    fileprivate lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
}
