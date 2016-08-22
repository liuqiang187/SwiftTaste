//
//  WXFriendCell.swift
//  swiftTaste
//
//  Created by Liu on 16/7/26.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class WXFriendCell: CommonTableViewCell {

    var user : WXUser?
        {
        didSet{
            avatarImageView.kf_setImageWithURL(NSURL.init(string: (user?.avatarURL)!)!, placeholderImage: UIImage.init(named: (user?.avatarURL)!))
            usernameLabel.text = user?.username
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(avatarImageView)
        addSubview(usernameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        leftFreeSpace = frameHeight * 0.18
        let spaceX = self.frameHeight * 0.18
        let spaceY = self.frameHeight * 0.17
        let imageWidth = self.frameHeight - spaceY * 2
        avatarImageView.frame = CGRectMake(spaceX, spaceY, imageWidth, imageWidth)
        
        let labelX = imageWidth + spaceX * 2
        let labelWidth = self.frameWidth - labelX - spaceX * 1.5
        usernameLabel.frame = CGRectMake(labelX, spaceY, labelWidth, imageWidth)
    }
    
    // MARK: - lazy var
    private lazy var avatarImageView : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var usernameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(17)
        return label
    }()
}
