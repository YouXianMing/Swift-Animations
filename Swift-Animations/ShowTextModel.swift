//
//  ShowTextModel.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/30.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class ShowTextModel: NSObject {
    
    var inputString        : String?
    var expendStringHeight : CGFloat?
    var normalStringHeight : CGFloat?
    
    convenience init(_ inputString : String) {
        
        self.init()
        self.inputString = inputString
    }
}
