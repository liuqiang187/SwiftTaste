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
            if item.type == .wxSettingItemTypeButton {
                cButton.setTitle(item.title, for: UIControlState())
                cButton.backgroundColor = item.btnBGColor
                cButton.setTitleColor(item.btnTitleColor, for: UIControlState())
                cButton.isHidden = false
                titleLabel.isHidden = true
            }
            else{
                cButton.isHidden = true
                titleLabel.text = item.title
                titleLabel.isHidden = false
            }
            if item.subTitle == nil {
                subTitleLabel.isHidden = true
            }
            else{
                subTitleLabel.text = item.subTitle
                subTitleLabel.isHidden = false
            }
            
            if (item.imageName == nil) {
                mainImageView.image = nil
                mainImageView.isHidden = true
            }
            else{
                mainImageView.image = UIImage.init(named: item.imageName!)
                mainImageView.isHidden = false
            }
            if item.middleImageName == nil {
                middleImageView.image = nil
                middleImageView.isHidden = true
            }
            else{
                middleImageView.image = UIImage.init(named: item.middleImageName!)
                middleImageView.isHidden = false
            }
            if item.rightImageName == nil {
                rightImageView.image = nil
                rightImageView.isHidden = true
            }
            else{
                rightImageView.image = UIImage.init(named: item.rightImageName!)
                rightImageView.isHidden = false
            }
            
            if item.type == .wxSettingItemTypeSwitch {
                cSwitch.isHidden = false
            }
            else{
                cSwitch.isHidden = true
            }
            
            if item.subImages.count > 0 {
                
                for index in 0 ..< item.subImages.count{
                    let imageName = item.subImages[index] 
                    
                    var button = UIButton()
                    if index < subImageArray.count {
                        button = subImageArray[index] 
                    }
                    else{
                        subImageArray.append(button)
                    }
                    button.setImage(UIImage.init(named: imageName), for: UIControlState())
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
        if item.type == .wxSettingItemTypeButton {
            let buttonX = self.frameWidth * 0.04
            let buttonY = self.frameHeight * 0.09
            let buttonWidth = self.frameWidth - buttonX * 2
            let buttonHeight = self.frameHeight - buttonY * 2
            cButton.frame = CGRect(x: buttonX, y: 0, width: buttonWidth, height: buttonHeight)
            return;
        }
        
        var x = spaceX
        var y = self.frameHeight * 0.22
        let h = self.frameHeight - y * 2
        y -= 0.25;      // 补线高度差
        var size = CGSize.zero
        
        // Main Image
        if (item.imageName != nil) {
            mainImageView.frame = CGRect(x: x, y: y, width: h, height: h)
            x += h + spaceX
        }
        // Title
        if (item.title != nil) {
            size = titleLabel.sizeThatFits(CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)))
            if item.alignment == .wxSettingItemAlignmentMiddle {
                titleLabel.frame = CGRect(x: (self.frameWidth - size.width) * 0.5, y: y, width: size.width, height: h)
            }
            else {
                titleLabel.frame = CGRect(x: x, y: y - 0.5, width: size.width, height: h)
            }
        }
        
        if item.alignment == .wxSettingItemAlignmentRight {
            var rx = self.frameWidth - (item.accessoryType == UITableViewCellAccessoryType.disclosureIndicator ? 35 : 10)
            if item.type == .wxSettingItemTypeSwitch {
                let cx = rx - self.cSwitch.frameWidth / 1.7
                cSwitch.center = CGPoint(x: cx, y: self.frameHeight / 2.0)
                rx -= self.cSwitch.frameWidth - 5
            }
            if (self.item.rightImageName != nil){
                let rh = self.frameHeight * CGFloat(self.item.rightImageHeightOfCell)
                let ry = (self.frameHeight - rh) / 2
                rx -= rh;
                rightImageView.frame = CGRect(x: rx, y: ry, width: rh, height: rh)
                rx -= rh * 0.15
            }
            
            if (self.item.subTitle != nil){
                size = subTitleLabel.sizeThatFits(CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)))
                rx -= size.width
                subTitleLabel.frame = CGRect(x: rx, y: y - 0.5, width: size.width, height: h)
                rx -= 5
            }
            
            if (self.item.middleImageName != nil){
                let mh = self.frameHeight * CGFloat(self.item.middleImageHeightOfCell);
                let my = (self.frameHeight - mh) / 2 - 0.5
                rx -= mh
                middleImageView.frame = CGRect(x: rx, y: my, width: mh, height: mh)
                rx -= mh * 0.15
            }
        }
        else if item.alignment == .wxSettingItemAlignmentLeft{
            var t = 105 as CGFloat
            if kScreenWidth() > 380 {
                t = 120
            }
            var lx = (x < t ? t : x);
            
            if (self.item.subTitle != nil){                
                size = subTitleLabel.sizeThatFits(CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)))
                subTitleLabel.frame = CGRect(x: lx, y: y - 0.5, width: size.width, height: h)
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
                        button.frame = CGRect(x: lx + (imageWidth + space) * CGFloat(index), y: (self.frameHeight - imageWidth) / 2, width: imageWidth, height: imageWidth)
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
    
    class func getHeightForText(_ item: WXSettingItem) -> CGFloat {
        if item.type == .wxSettingItemTypeButton {
            return 50.0
        }
        else if item.subImages.count > 0 {
            return 86.0
        }
        return 43.0
    }
    
    
    // MARK: - lazy var
    fileprivate lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    fileprivate lazy var subTitleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.gray
        return label
    }()
    
    fileprivate lazy var mainImageView = UIImageView.init()
    fileprivate lazy var middleImageView = UIImageView.init()
    fileprivate lazy var rightImageView = UIImageView.init()
    fileprivate lazy var subImageArray = [UIButton]()
    fileprivate lazy var cSwitch = UISwitch.init()
    
    fileprivate lazy var cButton : UIButton = {
       let btn = UIButton()
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 4
        btn.layer.borderColor = RGBA(188, 188, 188, A: 0.6).cgColor
        btn.layer.borderWidth = 0.5
        return btn
    }()
    
}
