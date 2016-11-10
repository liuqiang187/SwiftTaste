//
//  WXSettingHeaderFooteFView.swift
//  swiftTaste
//
//  Created by Liu on 16/7/21.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class WXSettingHeaderFooteFView: UITableViewHeaderFooterView {

    var text = ""
    {
        didSet{
            titleLabel.text = text
            layoutSubviews()
        }
    }
    
    override init(reuseIdentifier: String?) {
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        isUserInteractionEnabled = false
        addSubview(titleLabel)
        backgroundView = UIView.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let x = frameWidth * 0.065
        let w = frameWidth * 0.89
        size = titleLabel.sizeThatFits(CGSize(width: w, height: 200))
        titleLabel.frame = CGRect(x: x, y: 6, width: w, height: size.height)
    }
    
    class func getHeightForText(_ text: String) -> CGFloat {
        if text.isEmpty {
            return 15
        }
        hLabel.text = text
        let w = kScreenWidth() * 0.92
        return hLabel.sizeThatFits(CGSize(width: w, height: 200)).height + 14
    }
    
    // MARK: - lazy
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 0
        return label
    }()
    
    static var hLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
}
