//
//  WXFriendHeaderView.swift
//  swiftTaste
//
//  Created by Liu on 16/7/26.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class WXFriendHeaderView: UITableViewHeaderFooterView {

    var title : String?{
        didSet{
            titleLabel.text = title
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        let bgView = UIView.init()
        bgView.backgroundColor = DEFAULT_BACKGROUND_COLOR()
        self.backgroundView = bgView
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.frame = CGRectMake(10, 0, self.frameWidth - 15, self.frameHeight)
    }
    
    // MARK: - lazy var
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(14)
        label.textColor = UIColor.grayColor()
        return label
    }()
}
