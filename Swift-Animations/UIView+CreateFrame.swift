//
//  UIView+CreateFrame.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/7.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
     Create Line view.
     
     - parameter frame:     The frame you give.
     - parameter lineColor: The line color.
     
     - returns: Line view.
     */
    class func CreateLine(_ frame : CGRect, lineColor : UIColor) -> UIView {
    
        let view                    = UIView(frame: frame)
        view.backgroundColor        = lineColor
        view.isUserInteractionEnabled = false
        
        return view
    }
}
