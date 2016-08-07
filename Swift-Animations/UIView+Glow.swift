//
//  UIView+Glow.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/7.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

private var glowColorKey             : UInt8 = 0
private var glowRadiusKey            : UInt8 = 0
private var glowAnimationDurationKey : UInt8 = 0
private var hideDurationKey          : UInt8 = 0
private var glowDurationKey          : UInt8 = 0
private var glowOpacityKey           : UInt8 = 0
private var glowLayerKey             : UInt8 = 0
private var dispatchSourceKey        : UInt8 = 0

//
//                                     == 动画时间解析 ==
//
//  0.0 ------------- 0.0 ------------> glowOpacity [-------------] glowOpacity ------------> 0.0
//           T                 T                           T                          T
//           |                 |                           |                          |
//           |                 |                           |                          |
//           .                 .                           .                          .
//     hideDuration  glowAnimationDuration           glowDuration            glowAnimationDuration
//

extension UIView {
    
    // MARK: 可以设置的属性

    /// 辉光的颜色,默认值为红色
    var glowColor : UIColor? {
        
        get {
            
            if let tmpValue = objc_getAssociatedObject(self, &glowColorKey) as? UIColor {
                
                return tmpValue
                
            } else {
                
                return UIColor.redColor()
            }
        }
        
        set(newVal) {
            
            objc_setAssociatedObject(self, &glowColorKey, newVal, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 辉光的透明度,默认值为0.8
    var glowOpacity : Float? {
        
        get {
            
            if let tmpValue = objc_getAssociatedObject(self, &glowOpacityKey) as? Float {
                
                if tmpValue <= 0 || tmpValue >= 1 {
                    
                    return 0.8
                    
                } else {
                    
                    return tmpValue
                }
                
            } else {
                
                return 0.8
            }
        }
        
        set(newVal) {
            
            objc_setAssociatedObject(self, &glowOpacityKey, newVal, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 辉光的阴影半径,默认值为2.0
    var glowRadius : CGFloat? {
        
        get {
            
            if let tmpValue = objc_getAssociatedObject(self, &glowRadiusKey) as? CGFloat {
                
                if tmpValue <= 0 {
                    
                    return 2.0
                    
                } else {
                
                    return tmpValue
                }
                
            } else {
                
                return 2.0
            }
        }
        
        set(newVal) {
            
            objc_setAssociatedObject(self, &glowRadiusKey, newVal, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 一次完整的辉光周期(从显示到透明或者从透明到显示),默认1s
    var glowAnimationDuration : NSTimeInterval? {
        
        get {
            
            if let tmpValue = objc_getAssociatedObject(self, &glowAnimationDurationKey) as? NSTimeInterval {
                
                if tmpValue <= 0 {
                    
                    return 1.0
                    
                } else {
                    
                    return tmpValue
                }
                
            } else {
                
                return 1.0
            }
        }
        
        set(newVal) {
            
            objc_setAssociatedObject(self, &glowAnimationDurationKey, newVal, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 保持辉光时间(不设置,默认为0.5s)
    var glowDuration : CGFloat? {
        
        get {
            
            if let tmpValue = objc_getAssociatedObject(self, &glowDurationKey) as? CGFloat {
                
                if tmpValue <= 0 {
                    
                    return 0.5
                    
                } else {
                    
                    return tmpValue
                }
                
            } else {
                
                return 0.5
            }
        }
        
        set(newVal) {
            
            objc_setAssociatedObject(self, &glowDurationKey, newVal, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 不显示辉光的周期(不设置默认为0.5s)
    var hideDuration : CGFloat? {
        
        get {
            
            if let tmpValue = objc_getAssociatedObject(self, &hideDurationKey) as? CGFloat {
                
                if tmpValue <= 0 {
                    
                    return 0.5
                    
                } else {
                    
                    return tmpValue
                }
                
            } else {
                
                return 0.5
            }
        }
        
        set(newVal) {
            
            objc_setAssociatedObject(self, &hideDurationKey, newVal, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // MARK: 不可设置的属性
    
    private var glowLayer : CALayer? {
        
        get {
            
            if let tmpValue = objc_getAssociatedObject(self, &glowLayerKey) as? CALayer {
            
                return tmpValue
                
            } else {
            
                return nil
            }
        }
        
        set(newVal) {
            
            objc_setAssociatedObject(self, &glowLayerKey, newVal, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private var dispatchSource : dispatch_source_t? {
    
        get {
        
            if let tmpValue = objc_getAssociatedObject(self, &dispatchSourceKey) as? dispatch_source_t {
                
                return tmpValue
                
            } else {
                
                return nil
            }
        }
        
        set(newVal) {
        
            objc_setAssociatedObject(self, &dispatchSourceKey, newVal, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // MARK: 原子操作
    
    /**
     创建出辉光layer
     */
    func createGlowLayer() {
    
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.mainScreen().scale)
        self.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let path = UIBezierPath.init(rect: self.bounds)
        self.glowColor?.setFill()
        path.fillWithBlendMode(.SourceAtop, alpha: 1)
        
        self.glowLayer                = CALayer()
        self.glowLayer?.frame         = self.bounds
        self.glowLayer?.contents      = UIGraphicsGetImageFromCurrentImageContext().CGImage
        self.glowLayer?.opacity       = 0
        self.glowLayer?.shadowOffset  = CGSizeMake(0, 0)
        self.glowLayer?.shadowOpacity = 1
        
        UIGraphicsEndImageContext()
    }
    
    /**
     插入辉光的layer
     */
    func insertGlowLayer() {
        
        if (self.glowLayer != nil) {
            
            self.layer.addSublayer(self.glowLayer!)
        }
    }
    
    /**
     移除辉光的layer
     */
    func removeGlowLayer() {
        
        if (self.glowLayer != nil) {
            
            self.glowLayer?.removeFromSuperlayer()
            self.glowLayer = nil
        }
    }
    
    /**
     显示辉光
     
     - parameter animated: 是否执行动画
     */
    func glowToshowAnimated(animated : Bool) {

        self.glowLayer?.shadowColor  = self.glowColor?.CGColor
        self.glowLayer?.shadowRadius = self.glowRadius!
        
        if animated == true {
            
            let animation           = CABasicAnimation(keyPath: "opacity")
            animation.fromValue     = 0
            animation.toValue       = self.glowOpacity
            self.glowLayer?.opacity = self.glowOpacity!
            animation.duration      = self.glowAnimationDuration!
            self.glowLayer?.addAnimation(animation, forKey: "glowLayerOpacity")
            
        } else {
        
            self.glowLayer?.removeAnimationForKey("glowLayerOpacity")
            self.glowLayer?.opacity = self.glowOpacity!
        }
    }
    
    /**
     隐藏辉光
     
     - parameter animated: 是否显示动画
     */
    func glowToHideAnimated(animated : Bool) {
        
        self.glowLayer?.shadowColor  = self.glowColor?.CGColor
        self.glowLayer?.shadowRadius = self.glowRadius!
        
        if animated == true {
            
            let animation           = CABasicAnimation(keyPath: "opacity")
            animation.fromValue     = self.glowOpacity
            animation.toValue       = 0
            self.glowLayer?.opacity = 0
            animation.duration      = self.glowAnimationDuration!
            self.glowLayer?.addAnimation(animation, forKey: "glowLayerOpacity")
            
        } else {
            
            self.glowLayer?.removeAnimationForKey("glowLayerOpacity")
            self.glowLayer?.opacity = 0
        }
    }
    
    /**
     开始循环辉光
     */
    func startGlowLoop() {
        
        if self.dispatchSource == nil {
            
            let seconds      = self.glowAnimationDuration! * 2 + NSTimeInterval(self.glowDuration!) + NSTimeInterval(self.hideDuration!)
            let delaySeconds = self.glowAnimationDuration! + NSTimeInterval(self.glowDuration!)
            
            weak var weakSelf = self
            self.dispatchSource = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue())
            dispatch_source_set_timer(self.dispatchSource!, dispatch_time(DISPATCH_TIME_NOW, 0), UInt64(Double(NSEC_PER_SEC) * seconds), 0)
            dispatch_source_set_event_handler(self.dispatchSource!, {
                
                weakSelf!.glowToshowAnimated(true)
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(Double(NSEC_PER_SEC) * delaySeconds)), dispatch_get_main_queue(), { 
                    
                    weakSelf!.glowToHideAnimated(true)
                })
            })
            
            dispatch_resume(self.dispatchSource!)
        }
    }
    
    // MARK: 便利操作
    
    func startGlowWithGlowRadius(glowRadius : CGFloat?, glowOpacity : Float?, glowColor : UIColor?,
                                 glowDuration : CGFloat, hideDuration : CGFloat, glowAnimationDuration : NSTimeInterval) {
        
        self.glowRadius            = glowRadius
        self.glowOpacity           = glowOpacity
        self.glowColor             = glowColor
        self.glowDuration          = glowDuration
        self.hideDuration          = hideDuration
        self.glowAnimationDuration = glowAnimationDuration
        
        self.removeGlowLayer()
        self.createGlowLayer()
        self.insertGlowLayer()
        self.startGlowLoop()
    }
}





