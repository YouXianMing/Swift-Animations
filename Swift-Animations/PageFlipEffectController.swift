//
//  PageFlipEffectController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/22.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class PageFlipEffectController: NormalTitleViewController {
    
    private var math  : Math = Math(pointA: CGPointMake(0, 0), pointB: CGPointMake(Width(), 180))
    private var layer : CALayer!
    
    override func setup() {
        
        super.setup()
        
        let image = UIImage(named: "pic_1")
        let size  = Math.ResetFromSize((image?.size)!, withFixedWidth: Width() / 2.0)
        
        layer                        = CALayer()
        layer.anchorPoint            = CGPointMake(1.0, 0.5)
        layer.frame                  = CGRectMake(0, 0, Width() / 2, size.height)
        layer.allowsEdgeAntialiasing = true
        layer.position               = CGPointMake(Width() / 2, contentView!.middleY)
        layer.contents               = image?.CGImage
        layer.borderColor            = UIColor.blackColor().CGColor
        layer.borderWidth            = 3.0
        layer.masksToBounds          = true
        layer.transform              = CATransform3DMakeRotation(Math.RadianFromDegree(0), 0, 1, 1)
        contentView?.layer.addSublayer(layer)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(PageFlipEffectController.handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc private func handlePan(sender : UIPanGestureRecognizer) {
        
        let curPoint = sender.locationInView(view)
        let x        = curPoint.x
        
        // 初始化3D变换,获取默认值
        var perspectiveTransform = CATransform3DIdentity
        
        // 透视
        perspectiveTransform.m34 = -1.0 / 2000.0
        
        // 空间旋转
        perspectiveTransform = CATransform3DRotate(perspectiveTransform, Math.RadianFromDegree(x * math.k), 0, 1, 0)
        CATransaction.setDisableActions(true)
        layer.transform = perspectiveTransform
        
        layer.contents = UIImage(named: x >= Width() / 2.0 ? "pic_2" : "pic_1")?.CGImage
        
        if sender.state == .Ended {
            
            // 初始化3D变换,获取默认值
            var perspectiveTransform = CATransform3DIdentity
            
            // 透视
            perspectiveTransform.m34 = -1.0 / 2000.0
            
            // 空间旋转
            perspectiveTransform = CATransform3DRotate(perspectiveTransform, Math.RadianFromDegree(x >= Width() / 2.0 ? 180 : 0), 0, 1, 0)
            
            CATransaction.setDisableActions(false)
            layer.transform = perspectiveTransform
        }
    }
}
