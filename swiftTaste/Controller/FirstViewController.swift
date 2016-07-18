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
        
    }

    
    func btnClick()
    {
        let vc = NewFetureViewController()
        
        navigationController?.pushViewController(vc, animated: true)
        
        vc.clickBlock = { type in
            self.inputBtn.setTitle("点击" + type, forState: .Normal)
        }
    }
    
    private lazy var inputBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("点击", forState: .Normal)
        btn.backgroundColor = MainColor()
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn.addTarget(self, action: #selector(FirstViewController.btnClick), forControlEvents: .TouchUpInside)
        return btn
    }()
    
}
