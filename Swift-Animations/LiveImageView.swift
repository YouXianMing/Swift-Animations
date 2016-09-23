//
//  LiveImageView.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/17.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

// MARK: Public class : LiveImageView

class LiveImageView: UIImageView {
    
    // MARK: Properties.
    
    /// Animation's duration.
    var duration : CFTimeInterval = 0.3
    
    // MARK: Methods.
    
    /**
     Set image with animation or not.
     
     - parameter newVal:   The new image.
     - parameter animated: Animated or not.
     */
    func setImage(_ newVal : UIImage, animated : Bool) {
        
        if animated == true {
            
            let animation       = CABasicAnimation(keyPath: "contents")
            animation.fromValue = image?.cgImage
            animation.toValue   = newVal.cgImage
            animation.duration  = duration
            
            pLayer.contents = image?.cgImage
            pLayer.add(animation, forKey: nil)
            
            image = newVal
            
        } else {
            
            image = newVal
        }
    }
    
    // MARK: Private value & func.
    
    fileprivate var pLayer : CALayer!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        pLayer = layer
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
