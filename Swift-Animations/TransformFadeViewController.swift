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
    fileprivate var type                : EType = .typeOne
    fileprivate var count               : Int   = 0
    fileprivate var gcdTimer            : GCDTimer!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
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
        
        gcdTimer          = GCDTimer(in: GCDQueue.Main, delay: 1.0, interval: 8.0)
        weak var weakSelf = self
        gcdTimer.setTimerEventHandler { _ in
            
            if weakSelf?.type == .typeOne {
                
                weakSelf?.type = .typeTwo
                weakSelf?.contentView?.sendSubview(toBack: (weakSelf?.tranformFadeViewTwo)!)
                weakSelf?.tranformFadeViewTwo.image = weakSelf?.currentImage()
                weakSelf?.tranformFadeViewTwo.start(animated: false, transformTo: .show)
                weakSelf?.tranformFadeViewOne.start(animated: true,  transformTo: .fade)
                
            } else {
                
                weakSelf?.type = .typeOne
                weakSelf?.contentView?.sendSubview(toBack: (weakSelf?.tranformFadeViewOne)!)
                weakSelf?.tranformFadeViewOne.image = weakSelf?.currentImage()
                weakSelf?.tranformFadeViewOne.start(animated: false, transformTo: .show)
                weakSelf?.tranformFadeViewTwo.start(animated: true,  transformTo: .fade)
            }
        }
        
        gcdTimer.start()
    }
    
    fileprivate func currentImage() -> UIImage {
        
        count = (count + 1) % images.count
        return images[count]
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        gcdTimer.destroy()
    }
}
