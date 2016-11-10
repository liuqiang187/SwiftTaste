//
//  WXConfigData.swift
//  swiftTaste
//
//  Created by Liu on 16/7/25.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class WXConfigData: NSObject {
    
    class func getFriendListDataBy(_ array :[WXUser]) -> ([[WXUser]]) {
        
        var all = [[WXUser]]()
        
        for item in array {
            var arr = [WXUser]()
            arr.append(item)
            all.append(arr)
        }
        
        return all
    }
    
    class func getFriendListSectionBy(_ array :[WXUser]) -> ([String]) {
        
        var all = [String]()
        
        for item in array {
            
            let c = item.username?.characters.first
            all.append(String.init(c!))
        }
        
        return all
    }

    class func initFriendsTestData() -> ([WXUser]) {
        var items = [WXUser]()
        let user1 = WXUser()
        user1.username = "张三"
        user1.nikename = "三哥"
        user1.userID = "yun"
        user1.avatarURL = "dice_Action_0"
        items.append(user1)
        
        let user2 = WXUser()
        user2.username = "李四"
        user2.nikename = "四哥"
        user2.userID = "yun"
        user2.avatarURL = "dice_Action_1"
        items.append(user2)
        
        let user3 = WXUser()
        user3.username = "王五二"
        user3.nikename = "五哥"
        user3.userID = "yun"
        user3.avatarURL = "dice_Action_2"
        items.append(user3)
        
        let user4 = WXUser()
        user4.username = "吕轻侯"
        user4.nikename = "侯哥"
        user4.userID = "yun"
        user4.avatarURL = "dice_Action_3"
        items.append(user4)
        
        return items
    }
    
    class func getFriendsVCItems() -> WXSettingGrounp {
        
        let notify = WXSettingItem.createWithImageName("plugins_FriendNotify_36x36_", title: "新的朋友")
        let friendGroup = WXSettingItem.createWithImageName("add_friend_icon_addgroup_36x36_", title: "群聊")
        let tag = WXSettingItem.createWithImageName("Contact_icon_ContactTag_36x36_", title: "标签")
        let offical = WXSettingItem.createWithImageName("add_friend_icon_offical_36x36_", title: "公众号")
        let group = WXSettingGrounp()
        group.items = [notify,friendGroup,tag,offical]
        
        return group
    }
    
    class func getDiscoverVCItems() -> [WXSettingGrounp] {
        var items = [WXSettingGrounp]()
        
        let friendsAlbum = WXSettingItem.createWithImageName("ff_IconShowAlbum_25x25_", title: "朋友圈", subTitle: nil, rightImageName: "Mac-Machelper_54x54_")
        let group1 = WXSettingGrounp()
        group1.items = [friendsAlbum]
        items.append(group1)
        
        let qrCode = WXSettingItem.createWithImageName("ff_IconQRCode_25x25_", title: "扫一扫")
        let shake = WXSettingItem.createWithImageName("ff_IconShake_25x25_", title: "摇一摇")
        let group2 = WXSettingGrounp()
        group2.items = [qrCode,shake]
        items.append(group2)
        
        let location = WXSettingItem.createWithImageName("ff_IconLocationService_25x25_", title: "附近的人", subTitle: nil, rightImageName: nil)
        let bottle = WXSettingItem.createWithImageName("ff_IconBottle_25x25_", title: "漂流瓶")
        let group3 = WXSettingGrounp()
        group3.items = [location,bottle]
        items.append(group3)
        
        let shopping = WXSettingItem.createWithImageName("CreditCard_ShoppingBag_48x48_", title: "购物")
        let game = WXSettingItem.createWithImageName("MoreGame_25x25_", title: "游戏", subTitle: "英雄联盟", rightImageName: "EmotionsEmojiHL_50x50_@1x")
        let group4 = WXSettingGrounp()
        group4.items = [shopping,game]
        items.append(group4)
        
        return items
    }
    
    
    class func getMeMainVCItems() -> [WXSettingGrounp] {
        var items = [WXSettingGrounp]()
        
        let album = WXSettingItem.createWithImageName("MoreMyAlbum_25x25_", title: "相册")
        let favorite = WXSettingItem.createWithImageName("MoreMyFavorites_25x25_", title: "收藏")
        let bank = WXSettingItem.createWithImageName("MoreMyBankCard_25x25_", title: "钱包")
        let card = WXSettingItem.createWithImageName("MyCardPackageIcon_25x25_", title: "卡包")
        let group1 = WXSettingGrounp()
        group1.items = [album,favorite,bank,card]
        items.append(group1)
        
        let expression = WXSettingItem.createWithImageName("MoreGame_25x25_", title: "表情")
        let group2 = WXSettingGrounp()
        group2.items = [expression]
        items.append(group2)
        
        let setting = WXSettingItem.createWithImageName("MoreSetting_25x25_", title: "设置")
        let group3 = WXSettingGrounp()
        group3.items = [setting]
        items.append(group3)
        
        return items
    }
    
    class func getSettingVCItems() -> [WXSettingGrounp] {
        var items = [WXSettingGrounp]()
        
        let safe = WXSettingItem.createWithImageName(nil, title: "账号和安全", middleImageName: "ProfileLockOn_17x17_", subTitle: "已保护")
        let group1 = WXSettingGrounp()
        group1.items = [safe]
        items.append(group1)
        
        let noti = WXSettingItem.createWithTitle("新消息通知")
        let privacy = WXSettingItem.createWithTitle("隐私")
        let normal = WXSettingItem.createWithTitle("通用")
        let group2 = WXSettingGrounp()
        group2.items = [noti,privacy,normal]
        items.append(group2)
        
        let feedBack = WXSettingItem.createWithTitle("帮助与反馈")
        let about = WXSettingItem.createWithTitle("关于微信")
        let group3 = WXSettingGrounp()
        group3.items = [feedBack,about]
        items.append(group3)
        
        let exit = WXSettingItem.createWithTitle("退出登陆")
        exit.alignment = WXSettingItemAlignment.wxSettingItemAlignmentMiddle
        let group4 = WXSettingGrounp()
        group4.items = [exit]
        items.append(group4)
        
        return items
    }
    
    class func getMeDetailVCItems() -> [WXSettingGrounp] {
        var items = [WXSettingGrounp]()
        
        let avatar = WXSettingItem.createWithImageName(nil, title: "头像", subTitle: nil, rightImageName: "dice_Action_0")
        let name = WXSettingItem.createWithTitle("名字", subTitle: "迈克学_")
        let num = WXSettingItem.createWithTitle("微信号", subTitle: "liuqiang")
        let code = WXSettingItem.createWithTitle("我的二维码")
        let address = WXSettingItem.createWithTitle("我的地址")
        let group1 = WXSettingGrounp()
        group1.items = [avatar,name,num,code,address]
        items.append(group1)
        
        let sex = WXSettingItem.createWithTitle("性别", subTitle:"男")
        let pos = WXSettingItem.createWithTitle("地址", subTitle:"内蒙古 呼和浩特")
        let proverbs = WXSettingItem.createWithTitle("个性签名", subTitle:"memedais")
        let group2 = WXSettingGrounp()
        group2.items = [sex,pos,proverbs]
        items.append(group2)
        
        return items
    }
}
