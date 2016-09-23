//
//  TransformFadeViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/20.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

private enum EType : Int {
    
    case typeOne, typeTwo
}

class TransformFadeViewController: FullTitleVisualEffectViewController {

    fileprivate var images              : [UIImage]!
    fileprivate var tranformFadeViewOne : TranformFadeView!
    fileprivate var tranformFadeViewTwo : TranformFadeView!
    fileprivate var count               : Int       = 0
//    fileprivate var timer               : GCDTimer  = GCDTimer(inQueue: GCDQueue.mainQueue)
    fileprivate var type                : EType     = .typeOne
    
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
        tranformFadeViewOne.imageContentMode     = .scaleAspectFill
        tranformFadeViewOne.image                = currentImage()
        tranformFadeViewOne.start(animated: false, transformTo: .show)
        contentView!.addSubview(tranformFadeViewOne)
        
        tranformFadeViewTwo                      = TranformFadeView(frame: contentView!.bounds, verticalCount: 3, horizontalCount: 12,
                                                                    fadeDuradtion: 1, animationGapDuration: 0.075)
        tranformFadeViewTwo.imageContentMode     = .scaleAspectFill
        tranformFadeViewTwo.image                = currentImage()
        tranformFadeViewTwo.start(animated: false, transformTo: .fade)
        contentView!.addSubview(tranformFadeViewTwo)
        
        weak var wself = self
//        timer.event({
        
            wself?.timerEvent()
            
//            }, timeIntervalWithSeconds: 8.0, delayWithSeconds: 1.0)
//        timer.start()
    }
    
    fileprivate func timerEvent() {
        
        if type == .typeOne {
            
            type = .typeTwo
            contentView?.sendSubview(toBack: tranformFadeViewTwo)
            tranformFadeViewTwo.image = currentImage()
            tranformFadeViewTwo.start(animated: false, transformTo: .show)
            tranformFadeViewOne.start(animated: true,  transformTo: .fade)
            
        } else {
        
            type = .typeOne
            contentView?.sendSubview(toBack: tranformFadeViewOne)
            tranformFadeViewOne.image = currentImage()
            tranformFadeViewOne.start(animated: false, transformTo: .show)
            tranformFadeViewTwo.start(animated: true,  transformTo: .fade)
        }
    }
    
    fileprivate func currentImage() -> UIImage {
        
        count = (count + 1) % images.count
        return images[count]
    }
}
