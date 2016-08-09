//
//  ClassModel.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/9.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class ClassModel: NSObject {

    var className : String?
    var students  : [StudentModel]?
    var expend    : Bool?
    
    convenience init(className : String) {
        
        self.init()
        self.className = className
        self.students  = [StudentModel]();
        self.expend    = false
    }
}
