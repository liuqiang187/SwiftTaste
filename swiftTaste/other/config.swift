//
//  config.swift
//  swiftTaste
//
//  Created by Liu on 16/7/8.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

public func RGB(R: CGFloat, G: CGFloat, B: CGFloat) -> UIColor {
    return UIColor.init(red: R, green: G, blue: B, alpha: 1)
}

public func RGBA(R: CGFloat, G: CGFloat, B: CGFloat, A: CGFloat) -> UIColor {
    return UIColor.init(red: R, green: G, blue: B, alpha: A)
}

public func MainColor() -> UIColor {
    return UIColor.init(red: 111/255.0, green: 65/255.0, blue: 177/255.0, alpha: 1)
}
