//
//  CommentView.swift
//  swiftTaste
//
//  Created by Liu on 16/7/8.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class CommentView: UIView {

    var placeHolderStr : String?
    {
        didSet{
            if let _ = placeHolderStr {
                textFiled.placeholder = "回复:"+placeHolderStr!
                textFiled.becomeFirstResponder()
            }else{
                textFiled.placeholder = "评论"
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup()
    {
        
    }

    private lazy var textFiled : UITextField = {
        let text = UITextField(frame: CGRectZero)
        text.background = UIImage(named: "s_bg_3rd_292x43")
        text.placeholder = "评论"
        text.font = UIFont.systemFontOfSize(12)
        // 设置placeholder的字体
        text.setValue(UIFont.systemFontOfSize(12), forKeyPath: "_placeholderLabel.font")
        return text
    }()
}
