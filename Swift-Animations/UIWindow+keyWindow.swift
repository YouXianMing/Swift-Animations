//
//  UIWindow+keyWindow.swift
//  Swift-Animations
//
//  Created by YouXianMing on 2017/9/13.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

import UIKit

extension UIWindow {
    
    class func getKeyWindow() -> UIWindow {
        
        return UIApplication.shared.keyWindow!
    }
}
