//
//  WXSetting.swift
//  swiftTaste
//
//  Created by Liu on 16/7/21.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

enum WXSettingItemAlignment : Int {
    case wxSettingItemAlignmentLeft
    case wxSettingItemAlignmentRight
    case wxSettingItemAlignmentMiddle
}

enum WXSettingItemType : Int {
    case wxSettingItemTypeDefault
    case wxSettingItemTypeButton
    case wxSettingItemTypeSwitch
}

class WXSettingItem: NSObject {

    /************************ 数据 ************************/
    // 1 主图片， 左边
    var imageName  : String? = ""
    var imageURL = ""
    // 2 主标题
    var title  : String? = ""
    // 3.1 中间图片
    var middleImageName  : String? = ""
    var middlerImageURL = ""
    // 3.2 图片集
    var subImages = [String]()
    // 4 副标题
    var subTitle  : String? = ""
    // 5 右图片
    var rightImageName  : String? = ""
    var rightImageURL = ""
    
    /************************ 样式 ************************/
    var alignment : WXSettingItemAlignment = .wxSettingItemAlignmentRight{
        didSet{
            if alignment == .wxSettingItemAlignmentMiddle {
                accessoryType = .none
            }
        }
    }
    var type : WXSettingItemType = .wxSettingItemTypeDefault{
        didSet{
            if type == .wxSettingItemTypeSwitch {
                accessoryType = .none
                selectionStyle = .none
            }
            else if type == .wxSettingItemTypeButton {
                btnBGColor = RGB(2, 187, 0)
                btnTitleColor = UIColor.white
                accessoryType = .none
                selectionStyle = .none
                bgColor = UIColor.clear
            }
        }
    }
    
    var bgColor = UIColor.white
    var btnBGColor = UIColor.clear
    var btnTitleColor = UIColor.clear
    
    var titleColor = UIColor.black
    var titleFont = UIFont.systemFont(ofSize: 15.5)
    var subTitleColor = UIColor.gray
    var subTitleFont = UIFont.systemFont(ofSize: 15)
    
    var accessoryType : UITableViewCellAccessoryType = .disclosureIndicator
    var selectionStyle : UITableViewCellSelectionStyle = .default
    var rightImageHeightOfCell = 0.72
    var middleImageHeightOfCell = 0.35
    
    /************************ 类方法 ************************/
    class func createWithImageName(_ imageName: String?,title: String,middleImageName: String?,subTitle: String?,rightImageName: String?) -> WXSettingItem
    {
        let item = WXSettingItem()
        item.imageName = imageName
        item.middleImageName = middleImageName
        item.rightImageName = rightImageName
        item.title = title
        item.subTitle = subTitle
        return item
    }
    
    class func createWithImageName(_ imageName: String?, title: String, subTitle: String?, rightImageName: String?) -> WXSettingItem
    {
        return createWithImageName(imageName, title: title, middleImageName: nil, subTitle: subTitle, rightImageName: rightImageName)
    }
    
    class func createWithImageName(_ imageName: String?, title: String, middleImageName: String, subTitle: String) -> WXSettingItem
    {
        return createWithImageName(imageName, title: title, middleImageName: middleImageName, subTitle: subTitle, rightImageName: nil)
    }
    
    class func createWithImageName(_ imageName: String, title: String) -> WXSettingItem
    {
        return createWithImageName(imageName, title: title, subTitle: nil, rightImageName: nil)
    }
    
    class func createWithTitle(_ title: String, subTitle: String?) -> WXSettingItem
    {
        return createWithImageName(nil, title: title, subTitle: subTitle, rightImageName: nil)
    }
    
    class func createWithTitle(_ title: String) -> WXSettingItem {
        return createWithTitle(title, subTitle: nil)
    }
    
}


class WXSettingGrounp: NSObject {
    
    var headerTitle = ""
    var footerTitle = ""
    var items = [WXSettingItem]()
    var itemsCount = 0
    
    func itemAtIndex(_ index: NSInteger) -> WXSettingItem {
        return items[index]
    }
    
    func indexOfItem(_ item: WXSettingItem) -> NSInteger {
        return items.index(of: item)!
    }
}

