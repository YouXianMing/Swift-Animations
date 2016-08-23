//
//  MixedColorProgressViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/21.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class MixedColorProgressViewController: NormalTitleViewController {
    
    private var upView    : UIView!
    private var upLabel   : UILabel!
    private var downView  : UIView!
    private var downLabel : UILabel!
    private var timer     : GCDTimer = GCDTimer(inQueue: GCDQueue.mainQueue)
    
    override func setup() {
        
        super.setup()
        
        downView                     = UIView(frame: CGRectMake(0, 0, 220, 17))
        downView.center              = (contentView?.middlePoint)!
        downView.layer.cornerRadius  = 2
        downView.backgroundColor     = UIColor.whiteColor()
        downView.layer.masksToBounds = true
        contentView?.addSubview(downView)
        
        downLabel                  = UILabel(frame: downView.bounds)
        downLabel.font             = UIFont.HelveticaNeueThin(12.0)
        downLabel.text             = "YouXianMing - iOS Programmer"
        downLabel.textColor        = UIColor.redColor()
        downLabel.textAlignment    = .Center
        downView.layer.borderWidth = 0.5
        downView.layer.borderColor = UIColor.redColor().CGColor
        downView.addSubview(downLabel)
        
        upView                     = UIView(frame: CGRectMake(0, 0, 220, 17))
        upView.center              = (contentView?.middlePoint)!
        upView.layer.cornerRadius  = 2
        upView.backgroundColor     = UIColor.redColor()
        upView.layer.masksToBounds = true
        contentView?.addSubview(upView)
        
        upLabel               = UILabel(frame: upView.bounds)
        upLabel.font          = UIFont.HelveticaNeueThin(12.0)
        upLabel.text          = "YouXianMing - iOS Programmer"
        upLabel.textColor     = UIColor.whiteColor()
        upLabel.textAlignment = .Center
        upView.addSubview(upLabel)
        
        weak var wself = self
        timer.event({
            
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
                
                wself?.upView.width = CGFloat(arc4random() % 220)
                
                }, completion: nil)
            
            }, timeIntervalWithSeconds: 1, delayWithSeconds: 1)
        timer.start()
    }
}
