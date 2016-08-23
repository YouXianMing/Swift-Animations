//
//  ClassModel.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/9.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class ClassModel: NSObject {

    var className : String         = ""
    var students  : [StudentModel] = [StudentModel]()
    var expend    : Bool           = false
    
    convenience init(className : String) {
        
        self.init()
        self.className = className
    }
}
