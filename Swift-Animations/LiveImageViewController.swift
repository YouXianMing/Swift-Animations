//
//  LiveImageViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/17.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class LiveImageViewController: NormalTitleViewController {
    
    var timer  : GCDTimer!  = GCDTimer(inQueue: GCDQueue.mainQueue)
    var count  : NSInteger! = 0
    var images : [UIImage]! = [UIImage]()
    
    override func setup() {
        
        super.setup()
        
        images = [UIImage]()
        images.append(UIImage(named: "pic_1")!)
        images.append(UIImage(named: "pic_2")!)
        images.append(UIImage(named: "pic_3")!)
        images.append(UIImage(named: "pic_4")!)
        
        let image                       = images[0]
        let liveImageView               = LiveImageView(frame: CGRectMake(0, 0, image.size.width, image.size.height))
        liveImageView.center            = (contentView?.middlePoint)!
        liveImageView.layer.borderWidth = 3
        liveImageView.layer.borderColor = UIColor.blackColor().CGColor
        liveImageView.duration          = 0.5
        contentView?.addSubview(liveImageView)
        
        weak var wself = self
        timer.event({
            
            let currentIndex = (wself?.count)! % (wself?.images.count)!
            wself?.count     = (wself?.count)! + 1
            
            liveImageView.setImage(wself!.images[currentIndex], animated: true)
            
            UIView.animateWithDuration(0.5, animations: {
                
                var tmpRect          = liveImageView.bounds
                tmpRect.size         = (liveImageView.image?.size)!
                liveImageView.bounds = tmpRect
                liveImageView.center = (wself?.contentView?.middlePoint)!
            })
            
            }, timeIntervalWithSeconds: 1.0)
        
        timer.start()
    }
}
