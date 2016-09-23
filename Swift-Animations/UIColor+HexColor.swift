//
//  UIColor+HexColor.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/14.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#if os(iOS) || os(tvOS)
    
    import UIKit
    typealias HexColor = UIColor
    
#else
    
    import Cocoa
    typealias HexColor = NSColor
    
#endif

private extension Int {
    
    func duplicate4bits() -> Int {
        
        return (self << 4) + self
    }
}

extension HexColor {
    
    // MARK: class func.
    
    class func Hex(_ hex6 : Int) -> HexColor {
        
        if (0x000000 ... 0xFFFFFF) ~= hex6 {
            
            return HexColor(hex6: hex6, alpha: 1)!
            
        } else {
            
            return HexColor.white
        }
    }
    
    class func Hex6(_ hex6 : Int, alpha : Float) -> HexColor {
    
        if (0x000000 ... 0xFFFFFF) ~= hex6 {
        
            return HexColor(hex6: hex6, alpha: alpha)!
            
        } else {
        
            return HexColor.white
        }
    }
    
    class func Hex6(_ hex6 : Int) -> HexColor {
        
        if (0x000000 ... 0xFFFFFF) ~= hex6 {
            
            return HexColor(hex6: hex6, alpha: 1)!
            
        } else {
            
            return HexColor.white
        }
    }
    
    class func Hex3(_ hex3 : Int, alpha : Float) -> HexColor {
        
        if (0x000 ... 0xFFF) ~= hex3 {
            
            return HexColor(hex3: hex3, alpha: alpha)!
            
        } else {
            
            return HexColor.white
        }
    }
    
    class func Hex3(_ hex3 : Int) -> HexColor {
        
        if (0x000 ... 0xFFF) ~= hex3 {
            
            return HexColor(hex3: hex3, alpha: 1)!
            
        } else {
            
            return HexColor.white
        }
    }
    
    // MARK: Private func.
    
    fileprivate convenience init?(hex3: Int, alpha: Float) {
        
        self.init(red   : CGFloat(((hex3 & 0xF00) >> 8).duplicate4bits()) / 255.0,
                  green : CGFloat(((hex3 & 0x0F0) >> 4).duplicate4bits()) / 255.0,
                  blue  : CGFloat(((hex3 & 0x00F) >> 0).duplicate4bits()) / 255.0,
                  alpha : CGFloat(alpha))
    }
    
    fileprivate convenience init?(hex6: Int, alpha: Float) {
        
        self.init(red   : CGFloat((hex6 & 0xFF0000) >> 16) / 255.0,
                  green : CGFloat((hex6 & 0x00FF00) >> 8)  / 255.0,
                  blue  : CGFloat((hex6 & 0x0000FF) >> 0)  / 255.0,
                  alpha : CGFloat(alpha))
    }
}

