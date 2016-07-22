//
//  SecondViewController.swift
//  swiftTaste
//
//  Created by Liu on 16/7/8.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let imageArray : [UIImage!] = [UIImage.init(named: "dice_Action_0"),UIImage.init(named: "dice_Action_1"),UIImage.init(named: "dice_Action_2"),UIImage.init(named: "dice_Action_3")]
    
    
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
    
    func btnClick(){
        UIView.animateWithDuration(0.2) {
            self.inputBtn.snp_updateConstraints { (make) in
                make.centerY.equalTo(self.view.snp_centerY).offset(100)
            }
        }
        view.addSubview(imageView)
        imageView.snp_makeConstraints { (make) in
            make.centerX.equalTo(view.snp_centerX)
            make.centerY.equalTo(view.snp_centerY)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        imageView.animationImages = imageArray as? [UIImage]
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = 20
        imageView.startAnimating()
    }
    
     override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        if flag == true {
            UIView.animateWithDuration(0.5) {
                self.inputBtn.snp_updateConstraints { (make) in
                    make.centerX.equalTo(self.view.snp_centerX)
                    make.centerY.equalTo(self.view.snp_centerY)
                    make.height.equalTo(100)
                    make.width.equalTo(100)
                }
            }
        }
    }

    // MARK: - lazy var
    private lazy var inputBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("摇一摇", forState: .Normal)
        btn.backgroundColor = MainColor()
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn.addTarget(self, action: #selector(SecondViewController.btnClick), forControlEvents: .TouchUpInside)
        return btn
    }()

    private lazy var imageView : UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
}
