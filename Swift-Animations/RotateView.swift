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
    
    var rotateDuration : TimeInterval = 0.25
    
    // MARK: Animation method.
    
    func changeToUpAnimated(_ animated : Bool) {
        
        UIView.animate(withDuration: (animated == true ? self.rotateDuration : 0.0), animations: {
            
            self.transform = self.defaultTransform
        }) 
    }
    
    func changeToLeftAnimated(_ animated : Bool) {
        
        UIView.animate(withDuration: (animated == true ? self.rotateDuration : 0.0), animations: {
            
            self.transform = self.defaultTransform.rotated(by: CGFloat(-Double.pi / 2))
        }) 
    }
    
    func changeToRightAnimated(_ animated : Bool) {
        
        UIView.animate(withDuration: (animated == true ? self.rotateDuration : 0.0), animations: {
            
            self.transform = self.defaultTransform.rotated(by: CGFloat(Double.pi / 2))
        }) 
    }
    
    func changeToDownAnimated(_ animated : Bool) {
        
        UIView.animate(withDuration: (animated == true ? self.rotateDuration : 0.0), animations: {
            
            self.transform = self.defaultTransform.rotated(by: CGFloat(Double.pi))
        }) 
    }
    
    // MARK: Private value & func & system method.
    
    fileprivate var defaultTransform : CGAffineTransform!
    
    override init(frame: CGRect) {
        
        super.init(frame : frame)
        defaultTransform = self.transform
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
