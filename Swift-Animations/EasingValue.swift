//
//  EasingValue.swift
//  Swift-EasingAnimation
//
//  Created by YouXianMing on 15/10/21.
//
//  https://github.com/YouXianMing
//  http://home.cnblogs.com/u/YouXianMing/
//

import UIKit

class EasingValue: NSObject {
    
    // MARK: var
    
    /// 动画函数
    var function   : EasingFunction!
    
    /// 关键帧点数
    var frameCount : size_t!
    
    // MARK: init
    override init() {
        
        super.init()
        
        function   = EasingFunction.sineEaseIn
        frameCount = 60
    }
    
    init(withFunction : EasingFunction, frameCount : size_t) {
        
        super.init()
        
        self.function   = withFunction
        self.frameCount = frameCount
    }
    
    // MARK: func
    
    /**
    计算关键帧
    
    - parameter fromValue: 起始值
    - parameter toValue:   结束值
    
    - returns: 关键帧值数组
    */
    func frameValueWith(fromValue : Double, toValue : Double) -> [AnyObject] {
        
        let values = NSMutableArray(capacity: frameCount)
        
        var t  : Double = 0.0
        let dt : Double = 1.0 / (Double(frameCount) - 1)
        
        for _ in 0 ..< frameCount {
            
            let value = fromValue + (function.value())(t) * (toValue - fromValue)
            values.add(value)
            
            t += dt
        }

        return values as [AnyObject]
    }
    
    /**
    计算关键帧点
    
    - parameter fromPoint: 起始点
    - parameter toPoint:   结束点
    
    - returns: 关键帧点数组
    */
    func pointValueWith(fromPoint : CGPoint, toPoint : CGPoint) -> [AnyObject] {
        
        let values = NSMutableArray(capacity: frameCount)
        
        var t  : Double = 0.0
        let dt : Double = 1.0 / (Double(frameCount) - 1)
        
        for _ in 0 ..< frameCount {
            
            let x     : Double  = Double(fromPoint.x) + (function.value())(t) * (Double(toPoint.x) - Double(fromPoint.x))
            let y     : Double  = Double(fromPoint.y) + (function.value())(t) * (Double(toPoint.y) - Double(fromPoint.y))
            let point : CGPoint = CGPoint(x : x, y : y)
            values.add(NSValue(cgPoint: point))
            
            t += dt
        }
        
        return values as [AnyObject]
    }
    
    /**
    计算关键帧尺寸
    
    - parameter fromSize: 起始尺寸
    - parameter toSize:   结束尺寸
    
    - returns: 关键帧尺寸数组
    */
    func sizeValueWith(fromSize : CGSize, toSize : CGSize) -> [AnyObject] {
        
        let values = NSMutableArray(capacity: frameCount)
        
        var t  : Double = 0.0
        let dt : Double = 1.0 / (Double(frameCount) - 1)
        
        for _ in 0 ..< frameCount {
            
            let width  : Double = Double(fromSize.width)  + (function.value())(t) * (Double(toSize.width) - Double(fromSize.width))
            let height : Double = Double(fromSize.height) + (function.value())(t) * (Double(toSize.height) - Double(fromSize.height))
            let size   : CGSize = CGSize(width: width, height: height)
            values.add(NSValue(cgSize : size))
            
            t += dt
        }
        
        return values as [AnyObject]
    }
}
