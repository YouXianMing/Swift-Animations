//
//  CircleAnimationViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/16.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class CircleAnimationViewController: NormalTitleViewController {
    
    var circleView1 : CircleView!
    var circleView2 : CircleView!
    var circleView3 : CircleView!
    var circleView4 : CircleView!
    var timer       : GCDTimer!
    
    override func setup() {
        
        super.setup()
        
        let gapFromTop : CGFloat = 64.0 + 20.0
        let width      : CGFloat = Width()
        let halfWidth  : CGFloat = width / 2.0
        let radius     : CGFloat = width / 3.0 + 20
        let bounds     : CGRect  = CGRectMake(0, 0, radius, radius)
        
        let point1 = CGPointMake(halfWidth / 2, gapFromTop + halfWidth / 2)
        let point2 = CGPointMake(halfWidth / 2 + halfWidth, gapFromTop + halfWidth / 2)
        let point3 = CGPointMake(halfWidth / 2, gapFromTop + halfWidth / 2 + halfWidth)
        let point4 = CGPointMake(halfWidth / 2 + halfWidth, gapFromTop + halfWidth / 2 + halfWidth)
        
        circleView1        = CircleView(frame: bounds, lineWidth: 2, lineColor: UIColor.grayColor(), clockWise: true, startDegree: 0)
        circleView1.center = point1
        contentView?.addSubview(circleView1)
        
        circleView2        = CircleView(frame: bounds, lineWidth: radius / 2, lineColor: UIColor.blackColor(), clockWise: true, startDegree: 0)
        circleView2.center = point2
        contentView?.addSubview(circleView2)
        
        circleView3        = CircleView(frame: bounds, lineWidth: 2, lineColor: UIColor.blackColor(), clockWise: true, startDegree: 0)
        circleView3.center = point3
        contentView?.addSubview(circleView3)
        
        circleView4          = CircleView(frame: bounds, lineWidth: radius / 2, lineColor: UIColor.blackColor(), clockWise: true, startDegree: 0)
        let imageView        = UIImageView(frame: CGRectMake(0, 0, radius, radius))
        imageView.image      = UIImage(named: "colors")
        imageView.center     = point4
        imageView.layer.mask = self.circleView4.layer
        contentView?.addSubview(imageView)
        
        weak var weakSelf = self
        timer = GCDTimer(inQueue: GCDQueue.mainQueue)
        timer.event({
            
            let percent        = Double(arc4random() % 100) / 100.0
            let anotherPercent = Double(arc4random() % 100) / 100.0
            let smallPercent   = (percent < anotherPercent ? percent : anotherPercent)
            let largePercent   = (percent < anotherPercent ? anotherPercent : percent)
            
            weakSelf?.circleView1.strokeEnd(largePercent, easingFunction: .ElasticEaseInOut, animated: true, duration: 1.0)
            weakSelf?.circleView2.strokeEnd(largePercent, easingFunction: .ExponentialEaseInOut, animated: true, duration: 1.0)
            weakSelf?.circleView3.strokeStart(smallPercent, easingFunction: .ExponentialEaseInOut, animated: true, duration: 1.0)
            weakSelf?.circleView3.strokeEnd(largePercent,   easingFunction: .ExponentialEaseInOut, animated: true, duration: 1.0)
            weakSelf?.circleView4.strokeEnd(largePercent, easingFunction: .ExponentialEaseOut, animated: true, duration: 1.0)
            
            }, timeIntervalWithSeconds: 1.5)
        timer.start()
    }
}
