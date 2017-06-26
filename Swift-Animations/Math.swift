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
    class func DegreeFromRadian(_ radian : CGFloat) -> CGFloat {
        
        return ((radian) * (180.0 / CGFloat(Double.pi)));
    }
    
    /**
     Convert degree to radian.
     
     - parameter degree: Degree.
     
     - returns: Radian.
     */
    class func RadianFromDegree(_ degree : CGFloat) -> CGFloat {
        
        return ((degree) * CGFloat(Double.pi) / 180.0);
    }
    
    // MARK: Calculate radian.
    
    /**
     Radian value from math 'tan' function.
     
     - parameter sideA: Side A
     - parameter sideB: Side B
     
     - returns: Radian value.
     */
    class func RadianValueFromTanSideA(sideA : CGFloat, sideB : CGFloat) -> CGFloat {
        
        return atan2(sideA, sideB)
    }
    
    // MARK: Reset size.
    
    /**
     Get the new size with the fixed width.
     
     - parameter size:           Old size.
     - parameter withFixedWidth: The fixed width.
     
     - returns: New size.
     */
    class func ResetFromSize(_ size : CGSize, withFixedWidth : CGFloat) -> CGSize {
        
        let newHeight = size.height * (withFixedWidth / size.width)
        return CGSize(width: withFixedWidth, height: newHeight)
    }

    /**
     Get the new size with the fixed height.
     
     - parameter size:            Old size.
     - parameter withFixedHeight: The fixed width.
     
     - returns: New size.
     */
    class func ResetFromSize(_ size : CGSize, withFixedHeight : CGFloat) -> CGSize {

        let newWidth = size.width * (withFixedHeight / size.height)
        return CGSize(width: newWidth, height: withFixedHeight)
    }
    
    // MARK: Calculate once linear equation (Y = kX + b).
    
    var k : CGFloat!
    var b : CGFloat!
    
    convenience init(_ pointA : (CGFloat, CGFloat), _ pointB : (CGFloat, CGFloat)) {
        
        self.init()
        k = calculateSlope(x1: pointA.0, y1: pointA.1, x2: pointB.0, y2: pointB.1)
        b = calculateConstant(x1: pointA.0, y1: pointA.1, x2: pointB.0, y2: pointB.1)
    }
    
    /**
     Get X value when Y equal some number.
     
     - parameter yValue: Some number.
     
     - returns: X number.
     */
    func xValueWhenYEqual(_ yValue : CGFloat) -> CGFloat {
        
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
    func whenYEqual(_ yValue : CGFloat) -> (x : CGFloat, y : CGFloat) {
        
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
    func yValueWhenXEqual(_ xValue : CGFloat) -> CGFloat {
        
        return k * xValue + b
    }
    
    /**
     Get the point value when X equal some number.
     
     - parameter xValue: Some number.
     
     - returns: The point value.
     */
    func whenXEqual(_ xValue : CGFloat) -> (x : CGFloat, y : CGFloat) {
        
        return (xValue, k * xValue + b)
    }
    
    // MARK: Private func.
    
    fileprivate func calculateSlope(x1 : CGFloat, y1 : CGFloat, x2 : CGFloat, y2 : CGFloat) -> CGFloat {
    
        if x1 == x2 {
            
            return 0
            
        } else {
        
            return (y2 - y1) / (x2 - x1)
        }
    }
    
    fileprivate func calculateConstant(x1 : CGFloat, y1 : CGFloat, x2 : CGFloat, y2 : CGFloat) -> CGFloat {
        
        if x1 == x2 {
            
            return 0
            
        } else {
            
            return (y1*(x2 - x1) - x1*(y2 - y1)) / (x2 - x1)
        }
    }
}
