//
//  TransformFadeViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/20.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

private enum EType : Int {
    
    case TypeOne, TypeTwo
}

class TransformFadeViewController: FullTitleVisualEffectViewController {

    private var images              : [UIImage]!
    private var tranformFadeViewOne : TranformFadeView!
    private var tranformFadeViewTwo : TranformFadeView!
    private var count               : Int!      = 0
    private var timer               : GCDTimer! = GCDTimer(inQueue: GCDQueue.mainQueue)
    private var type                : EType!    = .TypeOne
    
    override func setup() {
        
        super.setup()
        
        images = [UIImage]()
        images.append(UIImage(named: "5")!)
        images.append(UIImage(named: "1")!)
        images.append(UIImage(named: "2")!)
        images.append(UIImage(named: "3")!)
        images.append(UIImage(named: "4")!)
        
        tranformFadeViewOne                      = TranformFadeView(frame: contentView!.bounds, verticalCount: 3, horizontalCount: 12,
                                                                    fadeDuradtion: 1, animationGapDuration: 0.075)
        tranformFadeViewOne.imageContentMode     = .ScaleAspectFill
        tranformFadeViewOne.image                = currentImage()
        tranformFadeViewOne.start(animated: false, transformTo: .Show)
        contentView!.addSubview(tranformFadeViewOne)
        
        tranformFadeViewTwo                      = TranformFadeView(frame: contentView!.bounds, verticalCount: 3, horizontalCount: 12,
                                                                    fadeDuradtion: 1, animationGapDuration: 0.075)
        tranformFadeViewTwo.imageContentMode     = .ScaleAspectFill
        tranformFadeViewTwo.image                = currentImage()
        tranformFadeViewTwo.start(animated: false, transformTo: .Fade)
        contentView!.addSubview(tranformFadeViewTwo)
        
        weak var wself = self
        timer.event({
            
            wself?.timerEvent()
            
            }, timeIntervalWithSeconds: 8.0, delayWithSeconds: 1.0)
        timer.start()
    }
    
    private func timerEvent() {
        
        if type == .TypeOne {
            
            type = .TypeTwo
            contentView?.sendSubviewToBack(tranformFadeViewTwo)
            tranformFadeViewTwo.image = currentImage()
            tranformFadeViewTwo.start(animated: false, transformTo: .Show)
            tranformFadeViewOne.start(animated: true,  transformTo: .Fade)
            
        } else {
        
            type = .TypeOne
            contentView?.sendSubviewToBack(tranformFadeViewOne)
            tranformFadeViewOne.image = currentImage()
            tranformFadeViewOne.start(animated: false, transformTo: .Show)
            tranformFadeViewTwo.start(animated: true,  transformTo: .Fade)
        }
    }
    
    private func currentImage() -> UIImage {
        
        count = (count + 1) % images.count
        return images[count]
    }
}
