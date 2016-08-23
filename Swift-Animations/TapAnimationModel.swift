//
//  TapAnimationModel.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/7.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class TapAnimationModel: NSObject {

    var name     : String = ""
    var selected : Bool   = false
    
    convenience init(name : String, selected : Bool) {
        
        self.init()
        self.name     = name
        self.selected = selected
    }
}
