//
//  CommentView.swift
//  swiftTaste
//
//  Created by Liu on 16/7/8.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

public let TextField_Change = "TextField_Change"

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
    
    fileprivate func setup()
    {
        backgroundColor = MainColor()
        
        addSubview(textFiled)
        
        textFiled.snp.makeConstraints { (make) in
            make.centerY.equalTo(snp.centerY)
            make.width.equalTo(snp.width).inset(1)
            make.height.equalTo(30)
            make.left.equalTo(snp.left).offset(1)
        }
    }

    fileprivate lazy var textFiled : UITextField = {
        let text = UITextField(frame: CGRect.zero)
        text.backgroundColor = UIColor.white
        text.placeholder = "评论"
        text.font = UIFont.systemFont(ofSize: 12)
        text.delegate = self
        // 设置placeholder的字体
        text.setValue(UIFont.systemFont(ofSize: 12), forKeyPath: "_placeholderLabel.font")
        return text
    }()
    
    
    
    // MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: TextField_Change), object: nil)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
