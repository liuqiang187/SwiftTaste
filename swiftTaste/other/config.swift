//
//  config.swift
//  swiftTaste
//
//  Created by Liu on 16/7/8.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

public func RGB(_ R: CGFloat, _ G: CGFloat, _ B: CGFloat) -> UIColor {
    return UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: 1)
}

public func RGBA(_ R: CGFloat, _ G: CGFloat, _ B: CGFloat, A: CGFloat) -> UIColor {
    return UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: A)
}

public func MainColor() -> UIColor {
    return RGB(31, 185, 34)
}

public func NavBarColor() -> UIColor {
    return RGB(56, 57, 63)
}

public func DEFAULT_BACKGROUND_COLOR() -> UIColor {
    return RGB(239, 239, 244)
}

public func kScreenWidth() -> CGFloat {
    return UIScreen.main.bounds.size.width
}

public func kScreenHeight() -> CGFloat {
    return UIScreen.main.bounds.size.height
}
