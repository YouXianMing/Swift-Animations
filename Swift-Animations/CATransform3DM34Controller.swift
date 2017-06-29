//
//  CATransform3DM34Controller.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/19.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class CATransform3DM34Controller: NormalTitleViewController {
    
    fileprivate var timer          : Timer!
    fileprivate var layer          : CALayer!
    fileprivate var transformState : Bool = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initLayer()
        
        // Init timer.
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(CATransform3DM34Controller.timerEvent), userInfo: nil, repeats: true)
    }
    
    fileprivate func initLayer() {
        
        let image         = UIImage(named: "1")
        layer             = CALayer()
        layer.frame       = CGRect(x: 0, y: 0, width: image!.size.width / 2, height: image!.size.height / 2)
        layer.position    = (contentView?.middlePoint)!
        layer.borderWidth = 4
        layer.borderColor = UIColor.black.cgColor
        layer.contents    = image?.cgImage
        contentView?.layer.addSublayer(layer)
    }
    
    func timerEvent() {
        
        if transformState == false {
            
            transformState = true
            transformStateEvent()
            
        } else {
            
            transformState = false
            normalStateEvent()
        }
    }
    
    fileprivate func transformStateEvent() {
        
        var perspectiveTransform = CATransform3DIdentity
        perspectiveTransform.m34 = -1.0 / 500.0
        perspectiveTransform     = CATransform3DTranslate(perspectiveTransform, 30, -35, 0)
        perspectiveTransform     = CATransform3DRotate(perspectiveTransform, Math.RadianFromDegree(30), 0.75, 1, -0.5)
        perspectiveTransform     = CATransform3DScale(perspectiveTransform, 0.75, 0.75, 0.75)
        
        layer.transform              = perspectiveTransform
        layer.allowsEdgeAntialiasing = true
        layer.speed                  = 0.5
    }
    
    fileprivate func normalStateEvent() {
        
        let perspectiveTransform = CATransform3DIdentity
        layer.transform          = perspectiveTransform
        layer.speed              = 0.5
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        timer.invalidate()
    }
}
