//
//  CommonTableViewCell.swift
//  swiftTaste
//
//  Created by Liu on 16/7/21.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

enum CellLineStyle : Int{
    case CellLineStyleDefault
    case CellLineStyleFill
    case CellLineStyleNone
}

class CommonTableViewCell: UITableViewCell {

    var leftFreeSpace : CGFloat = 0
    var bottomLineStyle : CellLineStyle = .CellLineStyleDefault{
        didSet{
            if bottomLineStyle == .CellLineStyleDefault {
                bottomLine.originX = leftFreeSpace
                bottomLine.frameWidth = self.frameWidth - leftFreeSpace
                bottomLine.hidden = false
            }
            else if bottomLineStyle == .CellLineStyleFill{
                bottomLine.originX = 0
                bottomLine.frameWidth = self.frameWidth
                bottomLine.hidden = false
            }
            else if bottomLineStyle == .CellLineStyleNone{
                bottomLine.hidden = true
            }
        }
    }
    var topLineStyle : CellLineStyle = .CellLineStyleNone{
        didSet{
            if topLineStyle == .CellLineStyleDefault {
                topLine.originX = leftFreeSpace
                topLine.frameWidth = self.frameWidth - leftFreeSpace
                topLine.hidden = false
            }
            else if topLineStyle == .CellLineStyleFill{
                topLine.originX = 0
                topLine.frameWidth = self.frameWidth
                topLine.hidden = false
            }
            else if topLineStyle == .CellLineStyleNone{
                topLine.hidden = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor.whiteColor()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topLine.originY = 0
        bottomLine.originY = frameHeight - bottomLine.frameHeight
    }
    
    // MARK: - lazy var
    private lazy var topLine : UIView = {
        let line = UIView()
        line.frameHeight = 0.5
        line.backgroundColor = UIColor.grayColor()
        line.alpha = 0.4
        return line
    }()

    private lazy var bottomLine : UIView = {
        let line = UIView()
        line.frameHeight = 0.5
        line.backgroundColor = UIColor.grayColor()
        line.alpha = 0.4
        return line
    }()
}
