//
//  SecondViewController.swift
//  swiftTaste
//
//  Created by Liu on 16/7/8.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let imageArray : [UIImage?] = [UIImage.init(named: "dice_Action_0"),UIImage.init(named: "dice_Action_1"),UIImage.init(named: "dice_Action_2"),UIImage.init(named: "dice_Action_3")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.title = "朋友"
        
//        view.backgroundColor = RGB(40, G: 162, B: 100)
        view.backgroundColor = UIColor.white
        
        setup()
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
        view.addSubview(imageView)
    }
    
    @objc func btnClick(){
        UIView.animate(withDuration: 0.2) {
            self.inputBtn.snp.updateConstraints { (make) in
                make.centerY.equalTo(self.view.snp.centerY).offset(100)
            }
        }
        imageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        imageView.animationImages = imageArray as? [UIImage]
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = 20
        imageView.startAnimating()
    }

    // MARK: - lazy var
    fileprivate lazy var inputBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("摇一摇", for: UIControlState())
        btn.backgroundColor = MainColor()
        btn.setTitleColor(UIColor.black, for: UIControlState())
        btn.addTarget(self, action: #selector(SecondViewController.btnClick), for: .touchUpInside)
        return btn
    }()

    fileprivate lazy var imageView = UIImageView()
    
}
