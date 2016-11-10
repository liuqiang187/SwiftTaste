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
    case userDetailCellTypeFriends
    case userDetailCellTypeMine
}

class WXUserDetailCell: CommonTableViewCell {

    var cellType : UserDetailCellType = .userDetailCellTypeMine
    {
        didSet{
            switch cellType {
            case .userDetailCellTypeFriends:
                userIDLabel.textColor = UIColor.gray
                userIDLabel.font = UIFont.systemFont(ofSize: 13)
            case .userDetailCellTypeMine:
                nikeNameLabel.isHidden = true
                userIDLabel.textColor = UIColor.black
                userIDLabel.font = UIFont.systemFont(ofSize: 14)
            }
        }
    }
    
    var user : WXUser?
    {
        didSet{
            avatarImageView.kf.setImage(with: URL.init(string: (user?.avatarURL)!),
                                        placeholder: UIImage.init(named: "dice_Action_0"),
                                        options: [.transition(.fade(1))],
                                        progressBlock: nil,
                                        completionHandler: nil)
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
        avatarImageView.frame = CGRect(x: spaceX, y: spaceY, width: imageWidth, height: imageWidth)
        
        let labelX = imageWidth + spaceX * 2
        let labelWidth = self.frameWidth - labelX - spaceX * 1.5
        var size = userIDLabel.sizeThatFits(CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)))
        let labelHeight = imageWidth * 0.42
        size.width = size.width > labelWidth ? labelWidth : size.width
        var labelY = cellType == .userDetailCellTypeMine ? spaceY * 1.45 : spaceY
        usernameLabel.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
        
        size = userIDLabel.sizeThatFits(CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)))
        size.width = size.width > labelWidth ? labelWidth : size.width
        labelY += labelHeight + (cellType == .userDetailCellTypeMine ? spaceY * 0.3 : spaceY * 0.2)
        userIDLabel.frame = CGRect(x: labelX, y: labelY, width: size.width, height: size.height)
        
        size = nikeNameLabel.sizeThatFits(CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)))
        size.width = size.width > labelWidth ? labelWidth : size.width
        labelY = userIDLabel.originY + userIDLabel.frameHeight + spaceY * 0.15
        nikeNameLabel.frame = CGRect(x: labelX, y: labelY, width: size.width, height: size.height)
    }
    
    // MARK: - lazy var
    fileprivate lazy var avatarImageView : UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 5.0
        return image
    }()
    
    fileprivate lazy var usernameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    fileprivate lazy var userIDLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.gray
        return label
    }()
    
    fileprivate lazy var nikeNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.gray
        return label
    }()
    
}
