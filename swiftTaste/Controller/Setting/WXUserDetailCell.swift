//
//  WXUserDetailCell.swift
//  swiftTaste
//
//  Created by Liu on 16/7/25.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit
import Kingfisher

enum UserDetailCellType : Int {
    case UserDetailCellTypeFriends
    case UserDetailCellTypeMine
}

class WXUserDetailCell: CommonTableViewCell {

    var cellType : UserDetailCellType = .UserDetailCellTypeMine
    {
        didSet{
            switch cellType {
            case .UserDetailCellTypeFriends:
                userIDLabel.textColor = UIColor.grayColor()
                userIDLabel.font = UIFont.systemFontOfSize(13)
            case .UserDetailCellTypeMine:
                nikeNameLabel.hidden = true
                userIDLabel.textColor = UIColor.blackColor()
                userIDLabel.font = UIFont.systemFontOfSize(14)
            }
        }
    }
    
    var user : WXUser?
    {
        didSet{
            avatarImageView.kf_setImageWithURL(NSURL.init(string: (user?.avatarURL)!)!, placeholderImage: UIImage.init(named: (user?.avatarURL)!))
            if (user?.username != nil) {
                usernameLabel.text = user?.username
                if (user?.nikename != nil) {
                    nikeNameLabel.text = "昵称：" + (user?.nikename)!
                    
                }
                else{
                    nikeNameLabel.text = ""
                }
            }
            else if (user?.nikename != nil){
                nikeNameLabel.text = (user?.nikename)!
            }
            
            if (user?.userID != nil) {
                userIDLabel.text = "微信号：" + (user?.userID)!
            }
            else{
                userIDLabel.text = ""
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        addSubview(userIDLabel)
        addSubview(nikeNameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        leftFreeSpace = frameWidth * 0.05
        super.layoutSubviews()
        
        let spaceX = self.frameWidth * 0.04
        let spaceY = self.frameHeight * 0.15
        let imageWidth = self.frameHeight - spaceY * 2
        avatarImageView.frame = CGRectMake(spaceX, spaceY, imageWidth, imageWidth)
        
        let labelX = imageWidth + spaceX * 2
        let labelWidth = self.frameWidth - labelX - spaceX * 1.5
        var size = userIDLabel.sizeThatFits(CGSizeMake(CGFloat(MAXFLOAT), CGFloat(MAXFLOAT)))
        let labelHeight = imageWidth * 0.42
        size.width = size.width > labelWidth ? labelWidth : size.width
        var labelY = cellType == .UserDetailCellTypeMine ? spaceY * 1.45 : spaceY
        usernameLabel.frame = CGRectMake(labelX, labelY, labelWidth, labelHeight)
        
        size = userIDLabel.sizeThatFits(CGSizeMake(CGFloat(MAXFLOAT), CGFloat(MAXFLOAT)))
        size.width = size.width > labelWidth ? labelWidth : size.width
        labelY += labelHeight + (cellType == .UserDetailCellTypeMine ? spaceY * 0.3 : spaceY * 0.2)
        userIDLabel.frame = CGRectMake(labelX, labelY, size.width, size.height)
        
        size = nikeNameLabel.sizeThatFits(CGSizeMake(CGFloat(MAXFLOAT), CGFloat(MAXFLOAT)))
        size.width = size.width > labelWidth ? labelWidth : size.width
        labelY = userIDLabel.originY + userIDLabel.frameHeight + spaceY * 0.15
        nikeNameLabel.frame = CGRectMake(labelX, labelY, size.width, size.height)
    }
    
    // MARK: - lazy var
    private lazy var avatarImageView : UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 5.0
        return image
    }()
    
    private lazy var usernameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(17)
        return label
    }()
    
    private lazy var userIDLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(14)
        label.textColor = UIColor.grayColor()
        return label
    }()
    
    private lazy var nikeNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(13)
        label.textColor = UIColor.grayColor()
        return label
    }()
    
}
