//
//  PageFlipEffectController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/22.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class PageFlipEffectController: NormalTitleViewController {
    
    fileprivate var math  : Math = Math((x : 0,       degree : 0),
                                        (x : Width(), degree : 180))
    fileprivate var layer : CALayer!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let image = UIImage(named: "pic_1")
        let size  = Math.ResetFromSize((image?.size)!, withFixedWidth: Width() / 2.0)
        
        layer                        = CALayer()
        layer.anchorPoint            = CGPoint(x: 1.0, y: 0.5)
        layer.frame                  = CGRect(x: 0, y: 0, width: Width() / 2, height: size.height)
        layer.allowsEdgeAntialiasing = true
        layer.position               = CGPoint(x: Width() / 2, y: contentView!.middleY)
        layer.contents               = image?.cgImage
        layer.borderColor            = UIColor.black.cgColor
        layer.borderWidth            = 3.0
        layer.masksToBounds          = true
        layer.transform              = CATransform3DMakeRotation(Math.RadianFromDegree(0), 0, 1, 1)
        contentView?.layer.addSublayer(layer)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(PageFlipEffectController.handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc fileprivate func handlePan(_ sender : UIPanGestureRecognizer) {
        
        let curPoint = sender.location(in: view)
        let x        = curPoint.x
        
        // 初始化3D变换,获取默认值
        var perspectiveTransform = CATransform3DIdentity
        
        // 透视
        perspectiveTransform.m34 = -1.0 / 2000.0
        
        // 空间旋转
        perspectiveTransform = CATransform3DRotate(perspectiveTransform, Math.RadianFromDegree(x * math.k), 0, 1, 0)
        CATransaction.setDisableActions(true)
        layer.transform = perspectiveTransform
        
        layer.contents = UIImage(named: x >= Width() / 2.0 ? "pic_2" : "pic_1")?.cgImage
        
        if sender.state == .ended {
            
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
