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
        
        view.backgroundColor = UIColor.white
        
        Thread.sleep(forTimeInterval: 2.0)//延长2秒
        
        NotificationCenter.default.addObserver(self, selector: #selector(FirstViewController.changeOffset), name: NSNotification.Name(rawValue: TextField_Change), object: nil)
        
        setup()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.lt_setBackgroundColor(NavBarColor())
    }
    
    fileprivate func setup()
    {
        view.addSubview(inputBtn)
        inputBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
    }
    
    @objc func btnClick()
    {
        let vc = NewFetureViewController()
//        let vc = MeSettingView()
        navigationController?.pushViewController(vc, animated: true)
        
        vc.clickBlock = { type in
            self.inputBtn.setTitle("点击" + type, for: UIControlState())
        }
    }
    
    fileprivate lazy var inputBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("点击", for: UIControlState())
        btn.backgroundColor = MainColor()
        btn.setTitleColor(UIColor.black, for: UIControlState())
        btn.addTarget(self, action: #selector(FirstViewController.btnClick), for: .touchUpInside)
        return btn
    }()
    
    fileprivate lazy var commentView : CommentView = {
        let view = CommentView()
        return view
    }()
    
    @objc fileprivate func changeOffset()
    {
        commentView.snp.updateConstraints { (make) in
            make.bottom.equalTo(inputBtn.snp.top).offset(-10)
        }
    }
}
