//
//  UIColor+Convenience.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/20.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

extension UIColor {

    /**
     Creates and returns a color object that has the same color space and component values as the receiver, but has the specified alpha component.
     
     - parameter alpha: The opacity value of the new UIColor object.
     
     - returns: The new UIColor object.
     */
    func alpha(_ alpha : CGFloat) -> UIColor {
        
        return self.withAlphaComponent(alpha)
    }
}
