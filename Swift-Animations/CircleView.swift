//
//  CircleView.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/16.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

// MARK: Public class : CircleView

class CircleView: UIView {
    
    // MARK: Convenience init.
    
    convenience init(frame: CGRect, lineWidth : CGFloat, lineColor : UIColor, clockWise : Bool, startDegree : CGFloat) {
        
        self.init(frame : frame)
        self.lineWidth   = lineWidth
        self.lineColor   = lineColor
        self.clockWise   = clockWise
        self.startDegree = startDegree
        self.makeEffective()
    }
    
    // MARK: Properties.
    
    /// Line width, default is 1.0.
    var lineWidth    : CGFloat {
        
        get { if pLineWidth <= 0 { return 1} else {return pLineWidth}}
        set(newVal) { pLineWidth = newVal}
    }
    
    /// Line color, default is black color.
    var lineColor    : UIColor {
    
        get { if pLineColor == nil { return UIColor.black} else {return pLineColor}}
        set(newVal) { pLineColor = newVal}
    }
    
    /// Clock wise or not, default is true.
    var clockWise    : Bool    = true
    
    /// Start degrees (0° ~ 360°), default is 0.
    var startDegree  : CGFloat = 0
    
    // MARK: Methods.
    
    /**
     Make the config effective, when you set all the properties, you must run this method to make the config effective.
     */
    func makeEffective() {
        
        let size   = bounds.size
        let radius = size.width / 2.0 - lineWidth / 2.0
        
        var tmpStartAngle : CGFloat
        var tmpEndAngle   : CGFloat
        
        if clockWise == true {
            
            tmpStartAngle = -radianFromDegrees(180 - startDegree)
            tmpEndAngle   = radianFromDegrees(180 + startDegree)
            
        } else {
        
            tmpStartAngle = radianFromDegrees(180 - startDegree)
            tmpEndAngle   = -radianFromDegrees(180 + startDegree)
        }
        
        let circlePath           = UIBezierPath(arcCenter: CGPoint(x: size.height / 2, y: size.width / 2),
                                                radius: radius, startAngle: tmpStartAngle, endAngle: tmpEndAngle, clockwise: clockWise)
        pCircleLayer.path        = circlePath.cgPath
        pCircleLayer.fillColor   = UIColor.clear.cgColor
        pCircleLayer.strokeColor = lineColor.cgColor
        pCircleLayer.lineWidth   = lineWidth
        pCircleLayer.strokeEnd   = 0
    }
    
    /**
     Stroke start animation.
     
     - parameter value:          StrokeStart value, range is [0, 1].
     - parameter easingFunction: Easing function enum value.
     - parameter animated:       Animated or not.
     - parameter duration:       The animation's duration.
     */
    func strokeStart(_ value : Double, easingFunction : EasingFunction, animated : Bool, duration : TimeInterval) {
        
        var strokeStartValue = value
        
        if strokeStartValue <= 0 {
            
            strokeStartValue = 0
            
        } else if strokeStartValue >= 1 {
        
            strokeStartValue = 1
        }
        
        if animated == true {
            
            let easingValue          = EasingValue(withFunction: easingFunction, frameCount: Int(duration * 60.0))
            let keyAnimation         = CAKeyframeAnimation(keyPath: "strokeStart")
            keyAnimation.duration    = duration
            keyAnimation.values      = easingValue.frameValueWith(fromValue: Double(pCircleLayer.strokeStart), toValue: strokeStartValue)
            
            pCircleLayer.strokeStart = CGFloat(strokeStartValue)
            pCircleLayer.add(keyAnimation, forKey: nil)
            
        } else {
        
            CATransaction.setDisableActions(true)
            pCircleLayer.strokeStart = CGFloat(strokeStartValue)
            CATransaction.setDisableActions(false)
        }
    }
    
    /**
     Stroke end animation.
     
     - parameter value:          StrokeEnd value, range is [0, 1].
     - parameter easingFunction: Easing function enum value.
     - parameter animated:       Animated or not.
     - parameter duration:       The animation's duration.
     */
    func strokeEnd(_ value : Double, easingFunction : EasingFunction, animated : Bool, duration : TimeInterval) {
        
        var strokeStartValue = value
        
        if strokeStartValue <= 0 {
            
            strokeStartValue = 0
            
        } else if strokeStartValue >= 1 {
            
            strokeStartValue = 1
        }
        
        if animated == true {
            
            let easingValue        = EasingValue(withFunction: easingFunction, frameCount: Int(duration * 60.0))
            let keyAnimation       = CAKeyframeAnimation(keyPath: "strokeEnd")
            keyAnimation.duration  = duration
            keyAnimation.values    = easingValue.frameValueWith(fromValue: Double(pCircleLayer.strokeEnd), toValue: strokeStartValue)
            
            pCircleLayer.strokeEnd = CGFloat(strokeStartValue)
            pCircleLayer.add(keyAnimation, forKey: nil)
            
        } else {
            
            CATransaction.setDisableActions(true)
            pCircleLayer.strokeEnd = CGFloat(strokeStartValue)
            CATransaction.setDisableActions(false)
        }
    }
    
    // MARK: Private value & func & system method.
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        pCircleLayer       = CAShapeLayer()
        pCircleLayer.frame = bounds
        layer.addSublayer(pCircleLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate var pCircleLayer : CAShapeLayer!
    fileprivate var pLineWidth   : CGFloat! = 1
    fileprivate var pLineColor   : UIColor! = UIColor.black
    
    fileprivate func radianFromDegrees(_ degrees : CGFloat) -> CGFloat {
    
        return (CGFloat(Double.pi) * degrees) / 180.0
    }
}
