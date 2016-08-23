//
//  ControllerItem.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/7.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class ControllerItem: NSObject {

    var controllerClass : AnyClass?
    var name            : String?
    
    convenience init(controllerClass : AnyClass, name : String) {
        
        self.init()
        self.controllerClass = controllerClass
        self.name            = name
    }
}
