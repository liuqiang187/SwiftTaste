//
//  CommentView.swift
//  swiftTaste
//
//  Created by Liu on 16/7/8.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

public let TextField_Change = "textFieldChange"

class CommentView: UIView ,UITextFieldDelegate {

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
        backgroundColor = MainColor()
        
        addSubview(textFiled)
        
        textFiled.snp_makeConstraints { (make) in
            make.centerY.equalTo(snp_centerY)
            make.width.equalTo(snp_width).inset(1)
            make.height.equalTo(30)
            make.left.equalTo(snp_left).offset(1)
        }
    }

    private lazy var textFiled : UITextField = {
        let text = UITextField(frame: CGRectZero)
        text.backgroundColor = UIColor.whiteColor()
        text.placeholder = "评论"
        text.font = UIFont.systemFontOfSize(12)
        // 设置placeholder的字体
        text.setValue(UIFont.systemFontOfSize(12), forKeyPath: "_placeholderLabel.font")
        return text
    }()
    
    
    
    // MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(textField: UITextField) {
        NSNotificationCenter.defaultCenter().postNotificationName(TextField_Change, object: nil)
    }
}
