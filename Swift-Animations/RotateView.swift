//
//  RotateView.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/14.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

// MARK: Public class : RotateView

class RotateView: UIView {

    // MARK: Properties.
    
    var rotateDuration : NSTimeInterval = 0.25
    
    // MARK: Animation method.
    
    func changeToUpAnimated(animated : Bool) {
        
        UIView.animateWithDuration((animated == true ? self.rotateDuration : 0.0)) {
            
            self.transform = self.defaultTransform
        }
    }
    
    func changeToLeftAnimated(animated : Bool) {
        
        UIView.animateWithDuration((animated == true ? self.rotateDuration : 0.0)) {
            
            self.transform = CGAffineTransformRotate(self.defaultTransform, CGFloat(-M_PI_2))
        }
    }
    
    func changeToRightAnimated(animated : Bool) {
        
        UIView.animateWithDuration((animated == true ? self.rotateDuration : 0.0)) {
            
            self.transform = CGAffineTransformRotate(self.defaultTransform, CGFloat(M_PI_2))
        }
    }
    
    func changeToDownAnimated(animated : Bool) {
        
        UIView.animateWithDuration((animated == true ? self.rotateDuration : 0.0)) {
            
            self.transform = CGAffineTransformRotate(self.defaultTransform, CGFloat(M_PI))
        }
    }
    
    // MARK: Private value & func & system method.
    
    private var defaultTransform : CGAffineTransform!
    
    override init(frame: CGRect) {
        
        super.init(frame : frame)
        defaultTransform = self.transform
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
