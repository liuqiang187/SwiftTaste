//
//  MeTableView.swift
//  swiftTaste
//
//  Created by Liu on 16/7/20.
//  Copyright © 2016年 Dajie. All rights reserved.
//

import UIKit

class MeSettingView: WXSettingBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "设置"
        
        data = WXConfigData.getSettingVCItems()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    
}
