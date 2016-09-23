//
//  UILabel+SizeToFit.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/30.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

extension UILabel {

    public func sizeToFitWithWidth(_ width : CGFloat, numberOfLines : Int = 0) {
        
        var frame          = self.frame
        frame.size.width   = width
        self.frame         = frame
        self.numberOfLines = numberOfLines
        sizeToFit()
    }
    
    public func sizeToFitWithString(_ string : String, width : CGFloat, numberOfLines : Int = 0) {
        
        text                = string
        var newFrame        = self.frame
        newFrame.size.width = width
        frame               = newFrame
        self.numberOfLines  = numberOfLines
        sizeToFit()
    }
}
