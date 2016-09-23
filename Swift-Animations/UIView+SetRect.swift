//
//  UIView+SetRect.swift
//  YouXianMing
//
//  Created by YouXianMing on 15/9/29.
//  Copyright © 2015年 YouXianMing All rights reserved.
//

import UIKit

/**
 UIScreen width.
 
 - returns: Screen width.
 */
public func Width() -> CGFloat {

    return UIScreen.main.bounds.size.width
}

/**
 UIScreen height.
 
 - returns: Screen height.
 */
public func Height() -> CGFloat {

    return UIScreen.main.bounds.size.height
}

/// Status bar height.
public let StatusBarHeight                 : CGFloat = 20

/// Navigation bar height.
public let NavigationBarHeight             : CGFloat = 44

/// Tabbar height.
public let TabbarHeight                    : CGFloat = 49

/// Status bar & navigation bar height.
public let StatusBarAndNavigationBarHeight : CGFloat = StatusBarHeight + NavigationBarHeight

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


