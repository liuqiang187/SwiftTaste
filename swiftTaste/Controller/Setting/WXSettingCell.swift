//
//  WXSettingCell.swift
//  swiftTaste
//
//  Created by Liu on 16/7/21.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class WXSettingCell: CommonTableViewCell  {

    var item : WXSettingItem = WXSettingItem(){
        didSet{
            if item.type == .WXSettingItemTypeButton {
                cButton.setTitle(item.title, forState: .Normal)
                cButton.backgroundColor = item.btnBGColor
                cButton.setTitleColor(item.btnTitleColor, forState: .Normal)
                cButton.hidden = false
                titleLabel.hidden = true
            }
            else{
                cButton.hidden = true
                titleLabel.text = item.title
                titleLabel.hidden = false
            }
            if item.subTitle == nil {
                subTitleLabel.hidden = true
            }
            else{
                subTitleLabel.text = item.subTitle
                subTitleLabel.hidden = false
            }
            
            if (item.imageName == nil) {
                mainImageView.image = nil
                mainImageView.hidden = true
            }
            else{
                mainImageView.image = UIImage.init(named: item.imageName!)
                mainImageView.hidden = false
            }
            if item.middleImageName == nil {
                middleImageView.image = nil
                middleImageView.hidden = true
            }
            else{
                middleImageView.image = UIImage.init(named: item.middleImageName!)
                middleImageView.hidden = false
            }
            if item.rightImageName == nil {
                rightImageView.image = nil
                rightImageView.hidden = true
            }
            else{
                rightImageView.image = UIImage.init(named: item.rightImageName!)
                rightImageView.hidden = false
            }
            
            if item.type == .WXSettingItemTypeSwitch {
                cSwitch.hidden = false
            }
            else{
                cSwitch.hidden = true
            }
            
            if item.subImages.count > 0 {
                
                for index in 0 ..< item.subImages.count{
                    let imageName = item.subImages[index] as! String
                    
                    var button = UIButton()
                    if index < subImageArray.count {
                        button = subImageArray[index] 
                    }
                    else{
                        subImageArray.append(button)
                    }
                    button.setImage(UIImage.init(named: imageName), forState: .Normal)
                    addSubview(button)
                }
                for index in item.subImages.count ..< subImageArray.count{
                    let button = subImageArray[index]
                    button.removeFromSuperview()
                }
            }
            backgroundColor = item.bgColor
            accessoryType = item.accessoryType
            selectionStyle = item.selectionStyle
            
            titleLabel.font = item.titleFont
            titleLabel.textColor = item.titleColor
            
            subTitleLabel.font = item.subTitleFont
            subTitleLabel.textColor = item.subTitleColor
            
            layoutSubviews()
        }
    }
    
    override func layoutSubviews() {
        leftFreeSpace = frameWidth * 0.05
        super.layoutSubviews()
        
        let spaceX = leftFreeSpace
        if item.type == .WXSettingItemTypeButton {
            let buttonX = self.frameWidth * 0.04
            let buttonY = self.frameHeight * 0.09
            let buttonWidth = self.frameWidth - buttonX * 2
            let buttonHeight = self.frameHeight - buttonY * 2
            cButton.frame = CGRectMake(buttonX, 0, buttonWidth, buttonHeight)
            return;
        }
        
        var x = spaceX
        var y = self.frameHeight * 0.22
        let h = self.frameHeight - y * 2
        y -= 0.25;      // 补线高度差
        var size = CGSizeZero
        
        // Main Image
        if (item.imageName != nil) {
            mainImageView.frame = CGRectMake(x, y, h, h)
            x += h + spaceX
        }
        // Title
        if (item.title != nil) {
            size = titleLabel.sizeThatFits(CGSizeMake(CGFloat(MAXFLOAT), CGFloat(MAXFLOAT)))
            if item.alignment == .WXSettingItemAlignmentMiddle {
                titleLabel.frame = CGRectMake((self.frameWidth - size.width) * 0.5, y, size.width, h)
            }
            else {
                titleLabel.frame = CGRectMake(x, y - 0.5, size.width, h)
            }
        }
        
        if item.alignment == .WXSettingItemAlignmentRight {
            var rx = self.frameWidth - (item.accessoryType == UITableViewCellAccessoryType.DisclosureIndicator ? 35 : 10)
            if item.type == .WXSettingItemTypeSwitch {
                let cx = rx - self.cSwitch.frameWidth / 1.7
                cSwitch.center = CGPointMake(cx, self.frameHeight / 2.0)
                rx -= self.cSwitch.frameWidth - 5
            }
            if (self.item.rightImageName != nil){
                let rh = self.frameHeight * CGFloat(self.item.rightImageHeightOfCell)
                let ry = (self.frameHeight - rh) / 2;
                rx -= rh;
                rightImageView.frame = CGRectMake(rx, ry, rh, rh)
                rx -= rh * 0.15;
            }
            
            if (self.item.subTitle != nil){
                size = subTitleLabel.sizeThatFits(CGSizeMake(CGFloat(MAXFLOAT), CGFloat(MAXFLOAT)))
                rx -= size.width;
                subTitleLabel.frame = CGRectMake(rx, y - 0.5, size.width, h)
                rx -= 5;
            }
            
            if (self.item.middleImageName != nil){
                let mh = self.frameHeight * CGFloat(self.item.middleImageHeightOfCell);
                let my = (self.frameHeight - mh) / 2 - 0.5;
                rx -= mh;
                middleImageView.frame = CGRectMake(rx, my, mh, mh)
                rx -= mh * 0.15;
            }
        }
        else if item.alignment == .WXSettingItemAlignmentLeft{
            var t = 105 as CGFloat
            if kScreenWidth() > 380 {
                t = 120
            }
            var lx = (x < t ? t : x);
            
            if (self.item.subTitle != nil){                
                size = subTitleLabel.sizeThatFits(CGSizeMake(CGFloat(MAXFLOAT), CGFloat(MAXFLOAT)))
                subTitleLabel.frame = CGRectMake(lx, y - 0.5, size.width, h)
                lx += size.width + 5
            }
            
            if item.subImages.count > 0 {
                let imageWidth = self.frameHeight * 0.65
                let width = self.frameWidth * 0.89 - lx
                var space = 0 as CGFloat
                var count = width / imageWidth * 1.1
                count = count < CGFloat(self.subImageArray.count) ? count : CGFloat(self.subImageArray.count)
                
                var index = 0
                
                for button : UIButton in subImageArray {
                    if (index < Int(count)) {
                        button.frame = CGRectMake(lx + (imageWidth + space) * CGFloat(index), (self.frameHeight - imageWidth) / 2, imageWidth, imageWidth)
                        space = imageWidth * 0.1
                    }
                    else{
                        button.removeFromSuperview()
                    }
                    index += 1
                }
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        
        addSubview(mainImageView)
        addSubview(middleImageView)
        addSubview(rightImageView)
        
        addSubview(cSwitch)
        addSubview(cButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func getHeightForText(item: WXSettingItem) -> CGFloat {
        if item.type == .WXSettingItemTypeButton {
            return 50.0
        }
        else if item.subImages.count > 0 {
            return 86.0
        }
        return 43.0
    }
    
    
    // MARK: - lazy var
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(17)
        return label
    }()
    
    private lazy var subTitleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(15)
        label.textColor = UIColor.grayColor()
        return label
    }()
    
    private lazy var mainImageView = UIImageView.init()
    private lazy var middleImageView = UIImageView.init()
    private lazy var rightImageView = UIImageView.init()
    private lazy var subImageArray = [UIButton]()
    private lazy var cSwitch = UISwitch.init()
    
    private lazy var cButton : UIButton = {
       let btn = UIButton()
        btn.titleLabel?.font = UIFont.systemFontOfSize(16)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 4
        btn.layer.borderColor = RGBA(188, 188, 188, A: 0.6).CGColor
        btn.layer.borderWidth = 0.5
        return btn
    }()
    
}
