//
//  Easing.swift
//  Swift-EasingAnimation
//
//  Created by YouXianMing on 15/10/21.
//
//  https://github.com/YouXianMing
//  http://home.cnblogs.com/u/YouXianMing/
//

import UIKit

enum EasingFunction: Int {
    
    case
    linearInterpolation = 1,
    
    // Quadratic easing; p^2
    quadraticEaseIn,
    quadraticEaseOut,
    quadraticEaseInOut,
    
    // Cubic easing; p^3
    cubicEaseIn,
    cubicEaseOut,
    cubicEaseInOut,
    
    // Quartic easing; p^4
    quarticEaseIn,
    quarticEaseOut,
    quarticEaseInOut,
    
    // Quintic easing; p^5
    quinticEaseIn,
    quinticEaseOut,
    quinticEaseInOut,
    
    // Sine wave easing; sin(p * PI/2)
    sineEaseIn,
    sineEaseOut,
    sineEaseInOut,
    
    // Circular easing; sqrt(1 - p^2)
    circularEaseIn,
    circularEaseOut,
    circularEaseInOut,
    
    // Exponential easing, base 2
    exponentialEaseIn,
    exponentialEaseOut,
    exponentialEaseInOut,
    
    // Exponentially-damped sine wave easing
    elasticEaseIn,
    elasticEaseOut,
    elasticEaseInOut,
    
    // Overshooting cubic easing;
    backEaseIn,
    backEaseOut,
    backEaseInOut,
    
    // Exponentially-decaying bounce easing
    bounceEaseIn,
    bounceEaseOut,
    bounceEaseInOut
    
    func value() -> ((Double) -> Double) {
        
        switch self {
            
        case .linearInterpolation:
            return Easing.LinearInterpolation
            
        case .quadraticEaseIn:
            return Easing.QuadraticEaseIn
            
        case .quadraticEaseOut:
            return Easing.QuadraticEaseOut
            
        case .quadraticEaseInOut:
            return Easing.QuadraticEaseInOut
            
        case .cubicEaseIn:
            return Easing.CubicEaseIn
            
        case .cubicEaseOut:
            return Easing.CubicEaseOut
            
        case .cubicEaseInOut:
            return Easing.CubicEaseInOut
            
        case .quarticEaseIn:
            return Easing.QuarticEaseIn
            
        case .quarticEaseOut:
            return Easing.QuarticEaseOut
            
        case .quarticEaseInOut:
            return Easing.QuarticEaseInOut
            
        case .quinticEaseIn:
            return Easing.QuinticEaseIn
            
        case .quinticEaseOut:
            return Easing.QuinticEaseOut
            
        case .quinticEaseInOut:
            return Easing.QuinticEaseInOut
            
        case .sineEaseIn:
            return Easing.SineEaseIn
            
        case .sineEaseOut:
            return Easing.SineEaseOut
            
        case .sineEaseInOut:
            return Easing.SineEaseInOut
            
        case .circularEaseIn:
            return Easing.CircularEaseIn
            
        case .circularEaseOut:
            return Easing.CircularEaseOut
            
        case .circularEaseInOut:
            return Easing.CircularEaseInOut
            
        case .exponentialEaseIn:
            return Easing.ExponentialEaseIn
            
        case .exponentialEaseOut:
            return Easing.ExponentialEaseOut
            
        case .exponentialEaseInOut:
            return Easing.ExponentialEaseInOut
            
        case .elasticEaseIn:
            return Easing.ElasticEaseIn
            
        case .elasticEaseOut:
            return Easing.ElasticEaseOut
            
        case .elasticEaseInOut:
            return Easing.ElasticEaseInOut
            
        case .backEaseIn:
            return Easing.BackEaseIn
            
        case .backEaseOut:
            return Easing.BackEaseOut
            
        case .backEaseInOut:
            return Easing.BackEaseInOut
            
        case .bounceEaseIn:
            return Easing.BounceEaseIn
            
        case .bounceEaseOut:
            return Easing.BounceEaseOut
            
        case .bounceEaseInOut:
            return Easing.BounceEaseInOut
        }
    }
}

class Easing: NSObject {
    
    // MARK: Linear interpolation (no easing)
    class func LinearInterpolation(_ p : Double) -> Double {
        
        return p
    }
    
    // MARK: Quadratic easing; p^2
    class func QuadraticEaseIn(_ p : Double) -> Double {
        
        return p * p
    }
    
    class func QuadraticEaseOut(_ p : Double) -> Double {
        
        return -(p * (p - 2))
    }
    
    class func QuadraticEaseInOut(_ p : Double) -> Double {
        
        if (p < 0.5) {
            
            return 2 * p * p
            
        } else {
            
            return (-2 * p * p) + (4 * p) - 1
        }
    }
    
    // MARK: Cubic easing; p^3
    class func CubicEaseIn(_ p : Double) -> Double {
        
        return p * p * p
    }
    
    class func CubicEaseOut(_ p : Double) -> Double {
        
        let f : Double = (p - 1)
        return f * f * f + 1
    }
    
    class func CubicEaseInOut(_ p : Double) -> Double {
        
        if (p < 0.5) {
            
            return 4 * p * p * p
            
        } else {
            
            let f : Double = ((2 * p) - 2)
            return 0.5 * f * f * f + 1
        }
    }
    
    // MARK: Quartic easing; p^4
    class func QuarticEaseIn(_ p : Double) -> Double {
        
        return p * p * p * p
    }
    
    class func QuarticEaseOut(_ p : Double) -> Double {
        
        let f : Double = (p - 1)
        return f * f * f * (1 - p) + 1
    }
    
    class func QuarticEaseInOut(_ p : Double) -> Double {
        
        if(p < 0.5) {
            
            return 8 * p * p * p * p
            
        } else {
            
            let f : Double = (p - 1);
            return -8 * f * f * f * f + 1
        }
    }
    
    // MARK: Quintic easing; p^5
    class func QuinticEaseIn(_ p : Double) -> Double {
        
        return p * p * p * p * p
    }
    
    class func QuinticEaseOut(_ p : Double) -> Double {
        
        let f : Double = (p - 1)
        return f * f * f * f * f + 1
    }
    
    class func QuinticEaseInOut(_ p : Double) -> Double {
        
        if (p < 0.5) {
            
            return 16 * p * p * p * p * p
            
        } else {
            
            let f : Double = ((2 * p) - 2)
            return  0.5 * f * f * f * f * f + 1
        }
    }
    
    // MARK: Sine wave easing; sin(p * PI/2)
    class func SineEaseIn(_ p : Double) -> Double {
        
        return sin((p - 1) * Double.pi / 2) + 1
    }
    
    class func SineEaseOut(_ p : Double) -> Double {
        
        return sin(p * Double.pi / 2)
    }
    
    class func SineEaseInOut(_ p : Double) -> Double {
        
        return 0.5 * (1 - cos(p * Double.pi))
    }
    
    // MARK: Circular easing; sqrt(1 - p^2)
    class func CircularEaseIn(_ p : Double) -> Double {
        
        return 1 - sqrt(1 - (p * p))
    }
    
    class func CircularEaseOut(_ p : Double) -> Double {
        
        return sqrt((2 - p) * p)
    }
    
    class func CircularEaseInOut(_ p : Double) -> Double {
        
        if (p < 0.5) {
            
            return 0.5 * (1 - sqrt(1 - 4 * (p * p)))
            
        } else {
            
            return 0.5 * (sqrt(-((2 * p) - 3) * ((2 * p) - 1)) + 1)
        }
    }
    
    // MARK: Exponential easing, base 2
    class func ExponentialEaseIn(_ p : Double) -> Double {
        
        return (p == 0.0) ? p : pow(2, 10 * (p - 1))
    }
    
    class func ExponentialEaseOut(_ p : Double) -> Double {
        
        return (p == 1.0) ? p : 1 - pow(2, -10 * p)
    }
    
    class func ExponentialEaseInOut(_ p : Double) -> Double {
        
        if (p == 0.0 || p == 1.0) {
            
            return p
        }
        
        if (p < 0.5) {
            
            return 0.5 * pow(2, (20 * p) - 10)
            
        } else {
            
            return -0.5 * pow(2, (-20 * p) + 10) + 1
        }
    }
    
    // MARK: Exponentially-damped sine wave easing
    class func ElasticEaseIn(_ p : Double) -> Double {
        
        return sin(13 * Double.pi / 2 * p) * pow(2, 10 * (p - 1))
    }
    
    class func ElasticEaseOut(_ p : Double) -> Double {
        
        return sin(-13 * Double.pi / 2 * (p + 1)) * pow(2, -10 * p) + 1
    }
    
    class func ElasticEaseInOut(_ p : Double) -> Double {
        
        if (p < 0.5) {
            
            return 0.5 * sin(13 * Double.pi / 2 * (2 * p)) * pow(2, 10 * ((2 * p) - 1))
            
        } else {
            
            return 0.5 * (sin(-13 * Double.pi / 2 * ((2 * p - 1) + 1)) * pow(2, -10 * (2 * p - 1)) + 2)
        }
    }
    
    // MARK: Overshooting cubic easing
    class func BackEaseIn(_ p : Double) -> Double {
        
        return p * p * p - p * sin(p * Double.pi)
    }
    
    class func BackEaseOut(_ p : Double) -> Double {
        
        let f : Double = (1 - p);
        return 1 - (f * f * f - f * sin(f * Double.pi))
    }
    
    class func BackEaseInOut(_ p : Double) -> Double {
        
        if (p < 0.5) {
            
            let f : Double = 2 * p
            return 0.5 * (f * f * f - f * sin(f * Double.pi))
            
        } else {
            
            let f   : Double = (1 - (2*p - 1))
            let tmp : Double = (f * f * f - f * sin(f * Double.pi))
            return 0.5 * (1 - tmp) + 0.5
        }
    }
    
    // MARK: Exponentially-decaying bounce easing
    class func BounceEaseIn(_ p : Double) -> Double {
        
        return 1 - BounceEaseOut(1 - p)
    }
    
    class func BounceEaseOut(_ p : Double) -> Double {
        
        if (p < 4/11.0) {
            
            return (121 * p * p)/16.0
            
        } else if (p < 8/11.0) {
            
            return (363/40.0 * p * p) - (99/10.0 * p) + 17/5.0
            
        } else if (p < 9/10.0) {
            
            return (4356/361.0 * p * p) - (35442/1805.0 * p) + 16061/1805.0
            
        } else {
            
            return (54/5.0 * p * p) - (513/25.0 * p) + 268/25.0
        }
    }
    
    class func BounceEaseInOut(_ p : Double) -> Double {
        
        if (p < 0.5) {
            
            return 0.5 * BounceEaseIn(p*2)
            
        } else {
            
            return 0.5 * BounceEaseOut(p * 2 - 1) + 0.5
        }
    }
}
