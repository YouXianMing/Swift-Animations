//
//  CircleAnimationViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/16.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class CircleAnimationViewController: NormalTitleViewController {
    
    fileprivate var circleView1 : CircleView!
    fileprivate var circleView2 : CircleView!
    fileprivate var circleView3 : CircleView!
    fileprivate var circleView4 : CircleView!
    fileprivate var timer       : GCDTimer!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let gapFromTop : CGFloat = 64.0 + 20.0
        let width      : CGFloat = Screen.Width
        let halfWidth  : CGFloat = width / 2.0
        let radius     : CGFloat = width / 3.0 + 20
        let bounds     : CGRect  = CGRect(x: 0, y: 0, width: radius, height: radius)
        
        let point1 = CGPoint(x: halfWidth / 2, y: gapFromTop + halfWidth / 2)
        let point2 = CGPoint(x: halfWidth / 2 + halfWidth, y: gapFromTop + halfWidth / 2)
        let point3 = CGPoint(x: halfWidth / 2, y: gapFromTop + halfWidth / 2 + halfWidth)
        let point4 = CGPoint(x: halfWidth / 2 + halfWidth, y: gapFromTop + halfWidth / 2 + halfWidth)
        
        circleView1        = CircleView(frame: bounds, lineWidth: 2, lineColor: UIColor.gray, clockWise: true, startDegree: 0)
        circleView1.center = point1
        contentView?.addSubview(circleView1)
        
        circleView2        = CircleView(frame: bounds, lineWidth: radius / 2, lineColor: UIColor.black, clockWise: true, startDegree: 0)
        circleView2.center = point2
        contentView?.addSubview(circleView2)
        
        circleView3        = CircleView(frame: bounds, lineWidth: 2, lineColor: UIColor.black, clockWise: true, startDegree: 0)
        circleView3.center = point3
        contentView?.addSubview(circleView3)
        
        circleView4          = CircleView(frame: bounds, lineWidth: radius / 2, lineColor: UIColor.black, clockWise: true, startDegree: 0)
        let imageView        = UIImageView(frame: CGRect(x: 0, y: 0, width: radius, height: radius))
        imageView.image      = UIImage(named: "colors")
        imageView.center     = point4
        imageView.layer.mask = self.circleView4.layer
        contentView?.addSubview(imageView)
        
        weak var weakSelf = self
        timer = GCDTimer(in: GCDQueue.Main, delay: 0.6, interval: 1.5)
        timer.setTimerEventHandler { _ in
            
            let percent        = Double(arc4random() % 100) / 100.0
            let anotherPercent = Double(arc4random() % 100) / 100.0
            let smallPercent   = (percent < anotherPercent ? percent : anotherPercent)
            let largePercent   = (percent < anotherPercent ? anotherPercent : percent)
            
            weakSelf?.circleView1.strokeEnd(largePercent,   easingFunction: .elasticEaseInOut,     animated: true, duration: 1.0)
            weakSelf?.circleView2.strokeEnd(largePercent,   easingFunction: .exponentialEaseInOut, animated: true, duration: 1.0)
            weakSelf?.circleView3.strokeStart(smallPercent, easingFunction: .exponentialEaseInOut, animated: true, duration: 1.0)
            weakSelf?.circleView3.strokeEnd(largePercent,   easingFunction: .exponentialEaseInOut, animated: true, duration: 1.0)
            weakSelf?.circleView4.strokeEnd(largePercent,   easingFunction: .exponentialEaseOut,   animated: true, duration: 1.0)
        }
        
        timer.start()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        timer.destroy()
    }
}
