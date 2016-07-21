//
//  config.swift
//  swiftTaste
//
//  Created by Liu on 16/7/8.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

public func RGB(R: CGFloat, G: CGFloat, B: CGFloat) -> UIColor {
    return UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: 1)
}

public func RGBA(R: CGFloat, G: CGFloat, B: CGFloat, A: CGFloat) -> UIColor {
    return UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: A)
}

public func MainColor() -> UIColor {
    return RGB(31, G: 185, B: 34)
}

public func NavBarColor() -> UIColor {
    return RGB(56, G: 57, B: 63)
}

public func DEFAULT_BACKGROUND_COLOR() -> UIColor {
    return RGB(239, G: 239, B: 244)
}

public func kScreenWidth() -> CGFloat {
    return UIScreen.mainScreen().bounds.size.width
}

public func kScreenHeight() -> CGFloat {
    return UIScreen.mainScreen().bounds.size.height
}