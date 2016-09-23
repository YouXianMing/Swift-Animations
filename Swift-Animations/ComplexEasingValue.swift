//
//  ComplexEasingValue.swift
//  Swift-EasingAnimation
//
//  Created by YouXianMing on 15/10/21.
//
//  https://github.com/YouXianMing
//  http://home.cnblogs.com/u/YouXianMing/
//

import UIKit

class ComplexEasingValue: EasingValue {

    /// 点A的动画函数（如果是 size，则点 A 表示 width；如果是 point，则点 A 表示 x）
    var functionA  : EasingFunction!
    
    /// 点B的动画函数（如果是 size，则点 B 表示 height；如果是 point，则点 B 表示 y）
    var functionB  : EasingFunction!
    
    // MARK: init
    override init() {
        
        super.init()
        
        functionA  = EasingFunction.sineEaseIn
        functionB  = EasingFunction.sineEaseIn
        frameCount = 60
    }
    
    init(withFunctionA : EasingFunction, FunctionB : EasingFunction, frameCount : size_t) {
        
        super.init()
        
        functionA       = withFunctionA
        functionB       = FunctionB
        self.frameCount = frameCount
    }
    
    /**
    计算关键帧
    
    - parameter fromValue: 起始值
    - parameter toValue:   结束值
    
    - returns: 关键帧值数组
    */
    override func pointValueWith(fromPoint : CGPoint, toPoint : CGPoint) -> [AnyObject] {
        
        let values = NSMutableArray(capacity: frameCount)
        
        var t  : Double = 0.0
        let dt : Double = 1.0 / (Double(frameCount) - 1)
        
        for _ in 0 ..< frameCount {
            
            let x     : Double  = Double(fromPoint.x) + (functionA.value())(t) * (Double(toPoint.x) - Double(fromPoint.x))
            let y     : Double  = Double(fromPoint.y) + (functionB.value())(t) * (Double(toPoint.y) - Double(fromPoint.y))
            let point : CGPoint = CGPoint(x : x, y : y)
            values.add(NSValue(cgPoint: point))
            
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
    override func sizeValueWith(fromSize : CGSize, toSize : CGSize) -> [AnyObject] {
        
        let values = NSMutableArray(capacity: frameCount)
        
        var t  : Double = 0.0
        let dt : Double = 1.0 / (Double(frameCount) - 1)
        
        for _ in 0 ..< frameCount {
            
            let width  : Double = Double(fromSize.width)  + (functionA.value())(t) * (Double(toSize.width) - Double(fromSize.width))
            let height : Double = Double(fromSize.height) + (functionB.value())(t) * (Double(toSize.height) - Double(fromSize.height))
            let size   : CGSize = CGSize(width: width, height: height)
            values.add(NSValue(cgSize : size))
            
            t += dt
        }
        
        return values as [AnyObject]
    }
}
