//
//  DiscoverViewController.swift
//  swiftTaste
//
//  Created by Liu on 16/7/25.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class DiscoverViewController: WXSettingBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hidesBottomBarWhenPushed = false
        
        navigationItem.title = "发现"
        
        data = getSettingVCItems()
    }
    
    func getSettingVCItems() -> [WXSettingGrounp] {
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
    
}
