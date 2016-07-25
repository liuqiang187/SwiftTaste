//
//  WXSetting.swift
//  swiftTaste
//
//  Created by Liu on 16/7/21.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

enum WXSettingItemAlignment : Int {
    case WXSettingItemAlignmentLeft
    case WXSettingItemAlignmentRight
    case WXSettingItemAlignmentMiddle
}

enum WXSettingItemType : Int {
    case WXSettingItemTypeDefault
    case WXSettingItemTypeButton
    case WXSettingItemTypeSwitch
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
    var subImages = []
    // 4 副标题
    var subTitle  : String? = ""
    // 5 右图片
    var rightImageName  : String? = ""
    var rightImageURL = ""
    
    /************************ 样式 ************************/
    var alignment : WXSettingItemAlignment = .WXSettingItemAlignmentRight{
        didSet{
            if alignment == .WXSettingItemAlignmentMiddle {
                accessoryType = .None
            }
        }
    }
    var type : WXSettingItemType = .WXSettingItemTypeDefault{
        didSet{
            if type == .WXSettingItemTypeSwitch {
                accessoryType = .None
                selectionStyle = .None
            }
            else if type == .WXSettingItemTypeButton {
                btnBGColor = RGB(2, 187, 0)
                btnTitleColor = UIColor.whiteColor()
                accessoryType = .None
                selectionStyle = .None
                bgColor = UIColor.clearColor()
            }
        }
    }
    
    var bgColor = UIColor.whiteColor()
    var btnBGColor = UIColor.clearColor()
    var btnTitleColor = UIColor.clearColor()
    
    var titleColor = UIColor.blackColor()
    var titleFont = UIFont.systemFontOfSize(15.5)
    var subTitleColor = UIColor.grayColor()
    var subTitleFont = UIFont.systemFontOfSize(15)
    
    var accessoryType : UITableViewCellAccessoryType = .DisclosureIndicator
    var selectionStyle : UITableViewCellSelectionStyle = .Default
    var rightImageHeightOfCell = 0.72
    var middleImageHeightOfCell = 0.35
    
    /************************ 类方法 ************************/
    class func createWithImageName(imageName: String?,title: String,middleImageName: String?,subTitle: String?,rightImageName: String?) -> WXSettingItem
    {
        let item = WXSettingItem()
        item.imageName = imageName
        item.middleImageName = middleImageName
        item.rightImageName = rightImageName
        item.title = title
        item.subTitle = subTitle
        return item
    }
    
    class func createWithImageName(imageName: String?, title: String, subTitle: String?, rightImageName: String?) -> WXSettingItem
    {
        return createWithImageName(imageName, title: title, middleImageName: nil, subTitle: subTitle, rightImageName: rightImageName)
    }
    
    class func createWithImageName(imageName: String?, title: String, middleImageName: String, subTitle: String) -> WXSettingItem
    {
        return createWithImageName(imageName, title: title, middleImageName: middleImageName, subTitle: subTitle, rightImageName: nil)
    }
    
    class func createWithImageName(imageName: String, title: String) -> WXSettingItem
    {
        return createWithImageName(imageName, title: title, subTitle: nil, rightImageName: nil)
    }
    
    class func createWithTitle(title: String, subTitle: String?) -> WXSettingItem
    {
        return createWithImageName(nil, title: title, subTitle: subTitle, rightImageName: nil)
    }
    
    class func createWithTitle(title: String) -> WXSettingItem {
        return createWithTitle(title, subTitle: nil)
    }
    
}


class WXSettingGrounp: NSObject {
    
    var headerTitle = ""
    var footerTitle = ""
    var items = [WXSettingItem]()
    var itemsCount = 0
    
    func itemAtIndex(index: NSInteger) -> WXSettingItem {
        return items[index]
    }
    
    func indexOfItem(item: WXSettingItem) -> NSInteger {
        return items.indexOf(item)!
    }
}

