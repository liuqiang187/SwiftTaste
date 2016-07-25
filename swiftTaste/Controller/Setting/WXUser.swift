//
//  WXUser.swift
//  swiftTaste
//
//  Created by Liu on 16/7/25.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class WXUser: NSObject {
    
    var username : String? = "迈克学_"
    var userID : String? = "liuqiang"
    var nikename : String?
    var avatarURL : String? = "dice_Action_0"
    var motto : String?
    var phoneNumber : String?
    var pinyin : String?
    var initial : String?
    
//    init(dict:[String : AnyObject]) {
//        super.init()
//        setValuesForKeysWithDictionary(dict)
//    }
    
    override func setValue(value: AnyObject?, forKey key: String) {
        
        super.setValue(value, forKey: key)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
