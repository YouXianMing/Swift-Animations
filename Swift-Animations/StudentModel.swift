//
//  StudentModel.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/9.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class StudentModel: NSObject {

    var name : String   = ""
    var age  : NSNumber = 0
    
    convenience init(name : String, age : NSNumber) {
        
        self.init()
        self.name = name
        self.age  = age
    }
}
