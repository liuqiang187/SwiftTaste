//
//  FirstViewController.swift
//  swiftTaste
//
//  Created by Liu on 16/7/8.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit
import SnapKit


class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.title = "聊天"
        
        view.backgroundColor = UIColor.whiteColor()
        
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(FirstViewController.changeOffset),
                                                         name: TextField_Change,
                                                         object: nil)
        
        setup()
    }
    
    private func setup()
    {
        view.addSubview(inputBtn)
        inputBtn.snp_makeConstraints { (make) in
            make.centerX.equalTo(view.snp_centerX)
            make.centerY.equalTo(view.snp_centerY)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        view.addSubview(commentView)
        commentView.snp_makeConstraints { (make) in
            make.top.equalTo(inputBtn.snp_bottom).offset(10)
            make.centerX.equalTo(view.snp_centerX)
            make.height.width.equalTo(100)
        }
    }

    
    func btnClick()
    {
        navigationController?.pushViewController(NewFetureViewController(), animated: true)
    }
    
    private lazy var inputBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("点击", forState: .Normal)
        btn.backgroundColor = MainColor()
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn.addTarget(self, action: #selector(FirstViewController.btnClick), forControlEvents: .TouchUpInside)
        return btn
    }()
    
    private lazy var commentView : CommentView = {
        let view = CommentView()
        return view
    }()
    
    @objc private func changeOffset()
    {
        view.snp_updateConstraints { (make) in
            make.centerY.equalTo(view.snp_centerY).offset(-50)
        }
    }
}
