//
//  UIView+SetRect.swift
//  YouXianMing
//
//  Created by YouXianMing on 15/9/29.
//  Copyright © 2015年 YouXianMing All rights reserved.
//

import UIKit

enum Screen {
    
    /// iPhone4 or iPhone4s
    case _320x480
    
    /// iPhone5 or iPhone5s or iPhoneSE
    case _320x568
    
    /// iPhone6 or iPhone6s or iPhone7 or iPhone8
    case _375x667
    
    /// iPhone6Plus or iPhone6sPlus or iPhone7sPlus or iPhone8sPlus
    case _414x736
    
    /// iPhoneX
    case _375x812
    
    /// Unknow
    case _unknow
    
    /// Get the screen type.
    ///
    /// - Returns: The screen type.
    private static func getScreen() -> Screen {
        
        let width  = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        var screen : Screen
        
        switch (width, height) {
            
        case (320, 480):
            screen = Screen._320x480

        case (320, 568):
            screen = Screen._320x568
            
        case (414, 736):
            screen = Screen._414x736

        case (375, 812):
            screen = Screen._375x812
            
        default:
            screen = Screen._unknow
        }
        
        return screen
    }
    
    /// Get the current screen.
    static let CurrentScreen = Screen.getScreen()
    
    /// UIScreen width.
    static let Width  = UIScreen.main.bounds.size.width
    
    /// UIScreen height.
    static let Height = UIScreen.main.bounds.size.height
}

/// Status bar height.
public let StatusBarHeight                   : CGFloat = 20

/// Navigation bar height.
public let NavigationBarHeight               : CGFloat = 44

/// Tabbar height.
public let TabbarHeight                      : CGFloat = 49

/// Status bar & navigation bar height.
public let StatusBarAndNavigationBarHeight   : CGFloat = StatusBarHeight + NavigationBarHeight

/// iPhoneX additional top safe height.
public let additionaliPhoneXTopSafeHeight    : CGFloat = 34

/// iPhoneX additional bottom safe height.
public let additionaliPhoneXBottomSafeHeight : CGFloat = 44

extension UIView {
    
    /// viewOrigin
    var viewOrigin : CGPoint {
        
        get { return frame.origin}
        
        set(newVal) {
            
            var tmpFrame    = frame
            tmpFrame.origin = newVal
            frame           = tmpFrame
        }
    }
    
    /// viewSize
    var viewSize : CGSize {
        
        get{ return frame.size}
        
        set(newVal) {
            
            var tmpFrame  = frame
            tmpFrame.size = newVal
            frame         = tmpFrame
        }
    }
    
    /// x
    var x : CGFloat {
        
        get { return frame.origin.x}
        
        set(newVal) {
            
            var tmpFrame      = frame
            tmpFrame.origin.x = newVal
            frame             = tmpFrame
        }
    }
    
    /// y
    var y : CGFloat {
        
        get { return frame.origin.y}
        
        set(newVal) {
            
            var tmpFrame      = frame
            tmpFrame.origin.y = newVal
            frame             = tmpFrame
        }
    }
    
    /// height
    var height : CGFloat {
        
        get { return frame.size.height}
        
        set(newVal) {
            
            var tmpFrame         = frame
            tmpFrame.size.height = newVal
            frame                = tmpFrame
        }
    }
    
    /// width
    var width : CGFloat {
        
        get { return frame.size.width}
        
        set(newVal) {
            
            var tmpFrame        = frame
            tmpFrame.size.width = newVal
            frame               = tmpFrame
        }
    }
    
    /// left
    var left : CGFloat {
        
        get { return frame.origin.x}
        
        set(newVal) {
            
            var tmpFrame      = frame
            tmpFrame.origin.x = newVal
            frame             = tmpFrame
        }
    }
    
    /// right
    var right : CGFloat {
        
        get { return frame.origin.x + frame.size.width}
        
        set(newVal) {
            
            var tmpFrame      = frame
            tmpFrame.origin.x = newVal - frame.size.width
            frame             = tmpFrame
        }
    }
    
    /// top
    var top : CGFloat {
        
        get { return frame.origin.y}
        
        set(newVal) {
            
            var tmpFrame      = frame
            tmpFrame.origin.y = newVal
            frame = tmpFrame
        }
    }
    
    /// bottom
    var bottom : CGFloat {
        
        get { return frame.origin.y + frame.size.height}
        
        set(newVal) {
            
            var tmpFrame      = frame
            tmpFrame.origin.y = newVal - frame.size.height
            frame             = tmpFrame
        }
    }
    
    /// centerX
    var centerX : CGFloat {
        
        get { return center.x}
        set(newVal) { center = CGPoint(x: newVal, y: center.y)}
    }
    
    /// centerY
    var centerY : CGFloat {
        
        get { return center.y}
        set(newVal) { center = CGPoint(x: center.x, y: newVal)}
    }
    
    /// middleX
    var middleX : CGFloat {
        
        get { return bounds.width / 2}
    }
    
    /// middleY
    var middleY : CGFloat {
        
        get { return bounds.height / 2}
    }
    
    /// middlePoint
    var middlePoint : CGPoint {
        
        get { return CGPoint(x: bounds.width / 2, y: bounds.height / 2)}
    }
}


