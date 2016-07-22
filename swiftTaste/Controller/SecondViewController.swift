//
//  SecondViewController.swift
//  swiftTaste
//
//  Created by Liu on 16/7/8.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.title = "朋友"
        
//        view.backgroundColor = RGB(40, G: 162, B: 100)
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

    // MARK: - lazy var
    private lazy var inputBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("摇一摇", forState: .Normal)
        btn.backgroundColor = MainColor()
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn.addTarget(self, action: #selector(FirstViewController.btnClick), forControlEvents: .TouchUpInside)
        return btn
    }()

}
