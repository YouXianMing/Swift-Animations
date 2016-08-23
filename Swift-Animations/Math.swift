//
//  Math.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/18.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class Math: NSObject {

    // MARK: Radian & degree.
    
    /**
     Convert radian to degree.
     
     - parameter radian: Radian.
     
     - returns: Degree.
     */
    class func DegreeFromRadian(radian : CGFloat) -> CGFloat {
        
        return ((radian) * (180.0 / CGFloat(M_PI)));
    }
    
    /**
     Convert degree to radian.
     
     - parameter degree: Degree.
     
     - returns: Radian.
     */
    class func RadianFromDegree(degree : CGFloat) -> CGFloat {
        
        return ((degree) * CGFloat(M_PI) / 180.0);
    }
    
    // MARK: Calculate radian.
    
    /**
     Radian value from math 'tan' function.
     
     - parameter sideA: Side A
     - parameter sideB: Side B
     
     - returns: Radian value.
     */
    class func RadianValueFromTanSideA(sideA sideA : CGFloat, sideB : CGFloat) -> CGFloat {
        
        return atan2(sideA, sideB)
    }
    
    // MARK: Reset size.
    
    /**
     Get the new size with the fixed width.
     
     - parameter size:           Old size.
     - parameter withFixedWidth: The fixed width.
     
     - returns: New size.
     */
    class func ResetFromSize(size : CGSize, withFixedWidth : CGFloat) -> CGSize {
        
        let newHeight = size.height * (withFixedWidth / size.width)
        return CGSizeMake(withFixedWidth, newHeight)
    }

    /**
     Get the new size with the fixed height.
     
     - parameter size:            Old size.
     - parameter withFixedHeight: The fixed width.
     
     - returns: New size.
     */
    class func ResetFromSize(size : CGSize, withFixedHeight : CGFloat) -> CGSize {

        let newWidth = size.width * (withFixedHeight / size.height)
        return CGSizeMake(newWidth, withFixedHeight)
    }
    
    // MARK: Calculate once linear equation (Y = kX + b).
    
    var k : CGFloat!
    var b : CGFloat!
    
    convenience init(pointA : CGPoint, pointB : CGPoint) {
        
        self.init()
        k = calculateSlope(x1: pointA.x, y1: pointA.y, x2: pointB.x, y2: pointB.y)
        b = calculateConstant(x1: pointA.x, y1: pointA.y, x2: pointB.x, y2: pointB.y)
    }
    
    /**
     Get X value when Y equal some number.
     
     - parameter yValue: Some number.
     
     - returns: X number.
     */
    func xValueWhenYEqual(yValue : CGFloat) -> CGFloat {
        
        if k == 0 {
            
            return 0
        }
        
        return (yValue - b) / k
    }
    
    /**
     Get the point value when Y equal some number.
     
     - parameter yValue: Some number.
     
     - returns: The point value.
     */
    func whenYEqual(yValue : CGFloat) -> (x : CGFloat, y : CGFloat) {
        
        if k == 0 {
            
            return (0, yValue)
        }
        
        return ((yValue - b) / k, yValue)
    }
    
    /**
     Get Y value when X equal some number.
     
     - parameter xValue: Some number.
     
     - returns: Y number.
     */
    func yValueWhenXEqual(xValue : CGFloat) -> CGFloat {
        
        return k * xValue + b
    }
    
    /**
     Get the point value when X equal some number.
     
     - parameter xValue: Some number.
     
     - returns: The point value.
     */
    func whenXEqual(xValue : CGFloat) -> (x : CGFloat, y : CGFloat) {
        
        return (xValue, k * xValue + b)
    }
    
    // MARK: Private func.
    
    private func calculateSlope(x1 x1 : CGFloat, y1 : CGFloat, x2 : CGFloat, y2 : CGFloat) -> CGFloat {
    
        if x1 == x2 {
            
            return 0
            
        } else {
        
            return (y2 - y1) / (x2 - x1)
        }
    }
    
    private func calculateConstant(x1 x1 : CGFloat, y1 : CGFloat, x2 : CGFloat, y2 : CGFloat) -> CGFloat {
        
        if x1 == x2 {
            
            return 0
            
        } else {
            
            return (y1*(x2 - x1) - x1*(y2 - y1)) / (x2 - x1)
        }
    }
}
