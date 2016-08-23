//
//  CATransform3DM34Controller.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/19.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class CATransform3DM34Controller: NormalTitleViewController {

    var layer          : CALayer!
    var timer          : GCDTimer = GCDTimer(inQueue: GCDQueue.mainQueue)
    var transformState : Bool     = false
    
    override func setup() {
        
        super.setup()
        
        initLayer()
        
        timerEvent()
    }
    
    private func initLayer() {
        
        let image         = UIImage(named: "1")
        layer             = CALayer()
        layer.frame       = CGRectMake(0, 0, image!.size.width / 2, image!.size.height / 2)
        layer.position    = (contentView?.middlePoint)!
        layer.borderWidth = 4
        layer.borderColor = UIColor.blackColor().CGColor
        layer.contents    = image?.CGImage
        contentView?.layer.addSublayer(layer)
    }
    
    private func timerEvent() {
        
        weak var wself = self
        timer.event({
            
            if wself?.transformState == false {
            
                wself?.transformState = true
                wself?.transformStateEvent()
                
            } else {
            
                wself?.transformState = false
                wself?.normalStateEvent()
            }
            
            }, timeIntervalWithSeconds: 2.0, delayWithSeconds: 1.0)
        timer.start()
    }

    private func transformStateEvent() {
        
        var perspectiveTransform = CATransform3DIdentity
        perspectiveTransform.m34 = -(1.0 / 500.0)
        perspectiveTransform     = CATransform3DTranslate(perspectiveTransform, 30, -35, 0)
        perspectiveTransform     = CATransform3DRotate(perspectiveTransform, Math.RadianFromDegree(30), 0.75, 1, -0.5)
        perspectiveTransform     = CATransform3DScale(perspectiveTransform, 0.75, 0.75, 0.75)
        
        layer.transform              = perspectiveTransform
        layer.allowsEdgeAntialiasing = true
        layer.speed                  = 0.5
    }
    
    private func normalStateEvent() {
        
        let perspectiveTransform = CATransform3DIdentity
        layer.transform          = perspectiveTransform
        layer.speed              = 0.5
    }
}
