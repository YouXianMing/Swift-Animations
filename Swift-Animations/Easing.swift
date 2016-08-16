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
    LinearInterpolation = 1,
    
    // Quadratic easing; p^2
    QuadraticEaseIn,
    QuadraticEaseOut,
    QuadraticEaseInOut,
    
    // Cubic easing; p^3
    CubicEaseIn,
    CubicEaseOut,
    CubicEaseInOut,
    
    // Quartic easing; p^4
    QuarticEaseIn,
    QuarticEaseOut,
    QuarticEaseInOut,
    
    // Quintic easing; p^5
    QuinticEaseIn,
    QuinticEaseOut,
    QuinticEaseInOut,
    
    // Sine wave easing; sin(p * PI/2)
    SineEaseIn,
    SineEaseOut,
    SineEaseInOut,
    
    // Circular easing; sqrt(1 - p^2)
    CircularEaseIn,
    CircularEaseOut,
    CircularEaseInOut,
    
    // Exponential easing, base 2
    ExponentialEaseIn,
    ExponentialEaseOut,
    ExponentialEaseInOut,
    
    // Exponentially-damped sine wave easing
    ElasticEaseIn,
    ElasticEaseOut,
    ElasticEaseInOut,
    
    // Overshooting cubic easing;
    BackEaseIn,
    BackEaseOut,
    BackEaseInOut,
    
    // Exponentially-decaying bounce easing
    BounceEaseIn,
    BounceEaseOut,
    BounceEaseInOut
    
    func value() -> ((Double) -> Double) {
        
        switch self {
            
        case .LinearInterpolation:
            return Easing.LinearInterpolation
            
        case .QuadraticEaseIn:
            return Easing.QuadraticEaseIn
            
        case .QuadraticEaseOut:
            return Easing.QuadraticEaseOut
            
        case .QuadraticEaseInOut:
            return Easing.QuadraticEaseInOut
            
        case .CubicEaseIn:
            return Easing.CubicEaseIn
            
        case .CubicEaseOut:
            return Easing.CubicEaseOut
            
        case .CubicEaseInOut:
            return Easing.CubicEaseInOut
            
        case .QuarticEaseIn:
            return Easing.QuarticEaseIn
            
        case .QuarticEaseOut:
            return Easing.QuarticEaseOut
            
        case .QuarticEaseInOut:
            return Easing.QuarticEaseInOut
            
        case .QuinticEaseIn:
            return Easing.QuinticEaseIn
            
        case .QuinticEaseOut:
            return Easing.QuinticEaseOut
            
        case .QuinticEaseInOut:
            return Easing.QuinticEaseInOut
            
        case .SineEaseIn:
            return Easing.SineEaseIn
            
        case .SineEaseOut:
            return Easing.SineEaseOut
            
        case .SineEaseInOut:
            return Easing.SineEaseInOut
            
        case .CircularEaseIn:
            return Easing.CircularEaseIn
            
        case .CircularEaseOut:
            return Easing.CircularEaseOut
            
        case .CircularEaseInOut:
            return Easing.CircularEaseInOut
            
        case .ExponentialEaseIn:
            return Easing.ExponentialEaseIn
            
        case .ExponentialEaseOut:
            return Easing.ExponentialEaseOut
            
        case .ExponentialEaseInOut:
            return Easing.ExponentialEaseInOut
            
        case .ElasticEaseIn:
            return Easing.ElasticEaseIn
            
        case .ElasticEaseOut:
            return Easing.ElasticEaseOut
            
        case .ElasticEaseInOut:
            return Easing.ElasticEaseInOut
            
        case .BackEaseIn:
            return Easing.BackEaseIn
            
        case .BackEaseOut:
            return Easing.BackEaseOut
            
        case .BackEaseInOut:
            return Easing.BackEaseInOut
            
        case .BounceEaseIn:
            return Easing.BounceEaseIn
            
        case .BounceEaseOut:
            return Easing.BounceEaseOut
            
        case .BounceEaseInOut:
            return Easing.BounceEaseInOut
        }
    }
}

class Easing: NSObject {
    
    // MARK: Linear interpolation (no easing)
    class func LinearInterpolation(p : Double) -> Double {
        
        return p
    }
    
    // MARK: Quadratic easing; p^2
    class func QuadraticEaseIn(p : Double) -> Double {
        
        return p * p
    }
    
    class func QuadraticEaseOut(p : Double) -> Double {
        
        return -(p * (p - 2))
    }
    
    class func QuadraticEaseInOut(p : Double) -> Double {
        
        if (p < 0.5) {
            
            return 2 * p * p
            
        } else {
            
            return (-2 * p * p) + (4 * p) - 1
        }
    }
    
    // MARK: Cubic easing; p^3
    class func CubicEaseIn(p : Double) -> Double {
        
        return p * p * p
    }
    
    class func CubicEaseOut(p : Double) -> Double {
        
        let f : Double = (p - 1)
        return f * f * f + 1
    }
    
    class func CubicEaseInOut(p : Double) -> Double {
        
        if (p < 0.5) {
            
            return 4 * p * p * p
            
        } else {
            
            let f : Double = ((2 * p) - 2)
            return 0.5 * f * f * f + 1
        }
    }
    
    // MARK: Quartic easing; p^4
    class func QuarticEaseIn(p : Double) -> Double {
        
        return p * p * p * p
    }
    
    class func QuarticEaseOut(p : Double) -> Double {
        
        let f : Double = (p - 1)
        return f * f * f * (1 - p) + 1
    }
    
    class func QuarticEaseInOut(p : Double) -> Double {
        
        if(p < 0.5) {
            
            return 8 * p * p * p * p
            
        } else {
            
            let f : Double = (p - 1);
            return -8 * f * f * f * f + 1
        }
    }
    
    // MARK: Quintic easing; p^5
    class func QuinticEaseIn(p : Double) -> Double {
        
        return p * p * p * p * p
    }
    
    class func QuinticEaseOut(p : Double) -> Double {
        
        let f : Double = (p - 1)
        return f * f * f * f * f + 1
    }
    
    class func QuinticEaseInOut(p : Double) -> Double {
        
        if (p < 0.5) {
            
            return 16 * p * p * p * p * p
            
        } else {
            
            let f : Double = ((2 * p) - 2)
            return  0.5 * f * f * f * f * f + 1
        }
    }
    
    // MARK: Sine wave easing; sin(p * PI/2)
    class func SineEaseIn(p : Double) -> Double {
        
        return sin((p - 1) * M_PI_2) + 1
    }
    
    class func SineEaseOut(p : Double) -> Double {
        
        return sin(p * M_PI_2)
    }
    
    class func SineEaseInOut(p : Double) -> Double {
        
        return 0.5 * (1 - cos(p * M_PI))
    }
    
    // MARK: Circular easing; sqrt(1 - p^2)
    class func CircularEaseIn(p : Double) -> Double {
        
        return 1 - sqrt(1 - (p * p))
    }
    
    class func CircularEaseOut(p : Double) -> Double {
        
        return sqrt((2 - p) * p)
    }
    
    class func CircularEaseInOut(p : Double) -> Double {
        
        if (p < 0.5) {
            
            return 0.5 * (1 - sqrt(1 - 4 * (p * p)))
            
        } else {
            
            return 0.5 * (sqrt(-((2 * p) - 3) * ((2 * p) - 1)) + 1)
        }
    }
    
    // MARK: Exponential easing, base 2
    class func ExponentialEaseIn(p : Double) -> Double {
        
        return (p == 0.0) ? p : pow(2, 10 * (p - 1))
    }
    
    class func ExponentialEaseOut(p : Double) -> Double {
        
        return (p == 1.0) ? p : 1 - pow(2, -10 * p)
    }
    
    class func ExponentialEaseInOut(p : Double) -> Double {
        
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
    class func ElasticEaseIn(p : Double) -> Double {
        
        return sin(13 * M_PI_2 * p) * pow(2, 10 * (p - 1))
    }
    
    class func ElasticEaseOut(p : Double) -> Double {
        
        return sin(-13 * M_PI_2 * (p + 1)) * pow(2, -10 * p) + 1
    }
    
    class func ElasticEaseInOut(p : Double) -> Double {
        
        if (p < 0.5) {
            
            return 0.5 * sin(13 * M_PI_2 * (2 * p)) * pow(2, 10 * ((2 * p) - 1))
            
        } else {
            
            return 0.5 * (sin(-13 * M_PI_2 * ((2 * p - 1) + 1)) * pow(2, -10 * (2 * p - 1)) + 2)
        }
    }
    
    // MARK: Overshooting cubic easing
    class func BackEaseIn(p : Double) -> Double {
        
        return p * p * p - p * sin(p * M_PI)
    }
    
    class func BackEaseOut(p : Double) -> Double {
        
        let f : Double = (1 - p);
        return 1 - (f * f * f - f * sin(f * M_PI))
    }
    
    class func BackEaseInOut(p : Double) -> Double {
        
        if (p < 0.5) {
            
            let f : Double = 2 * p
            return 0.5 * (f * f * f - f * sin(f * M_PI))
            
        } else {
            
            let f   : Double = (1 - (2*p - 1))
            let tmp : Double = (f * f * f - f * sin(f * M_PI))
            return 0.5 * (1 - tmp) + 0.5
        }
    }
    
    // MARK: Exponentially-decaying bounce easing
    class func BounceEaseIn(p : Double) -> Double {
        
        return 1 - BounceEaseOut(1 - p)
    }
    
    class func BounceEaseOut(p : Double) -> Double {
        
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
    
    class func BounceEaseInOut(p : Double) -> Double {
        
        if (p < 0.5) {
            
            return 0.5 * BounceEaseIn(p*2)
            
        } else {
            
            return 0.5 * BounceEaseOut(p * 2 - 1) + 0.5
        }
    }
}
