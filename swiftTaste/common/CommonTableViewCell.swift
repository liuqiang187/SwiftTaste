//
//  CommonTableViewCell.swift
//  swiftTaste
//
//  Created by Liu on 16/7/21.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

enum CellLineStyle : Int{
    case cellLineStyleDefault
    case cellLineStyleFill
    case cellLineStyleNone
}

class CommonTableViewCell: UITableViewCell {

    var leftFreeSpace : CGFloat = 0
    var bottomLineStyle : CellLineStyle = .cellLineStyleDefault{
        didSet{
            if bottomLineStyle == .cellLineStyleDefault {
                bottomLine.originX = leftFreeSpace
                bottomLine.frameWidth = kScreenWidth() - leftFreeSpace
                bottomLine.isHidden = false
            }
            else if bottomLineStyle == .cellLineStyleFill{
                bottomLine.originX = 0
                bottomLine.frameWidth = kScreenWidth()
                bottomLine.isHidden = false
            }
            else if bottomLineStyle == .cellLineStyleNone{
                bottomLine.isHidden = true
            }
        }
    }
    var topLineStyle : CellLineStyle = .cellLineStyleNone{
        didSet{
            if topLineStyle == .cellLineStyleDefault {
                topLine.originX = leftFreeSpace
                topLine.frameWidth = kScreenWidth() - leftFreeSpace
                topLine.isHidden = false
            }
            else if topLineStyle == .cellLineStyleFill{
                topLine.originX = 0
                topLine.frameWidth = kScreenWidth()
                topLine.isHidden = false
            }
            else if topLineStyle == .cellLineStyleNone{
                topLine.isHidden = true
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.white
        addSubview(topLine)
        addSubview(bottomLine)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topLine.originY = 0
        bottomLine.originY = frameHeight - bottomLine.frameHeight
    }
    
    // MARK: - lazy var
    fileprivate lazy var topLine : UIView = {
        let line = UIView()
        line.frameHeight = 0.5
        line.backgroundColor = UIColor.gray
        line.alpha = 0.4
        return line
    }()

    fileprivate lazy var bottomLine : UIView = {
        let line = UIView()
        line.frameHeight = 0.5
        line.backgroundColor = UIColor.gray
        line.alpha = 0.4
        return line
    }()
}
