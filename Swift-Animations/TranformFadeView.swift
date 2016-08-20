//
//  TranformFadeView.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/20.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

enum TranformFadeViewAnimatedType : Int {
    
    case Fade, Show
}

class TranformFadeView: UIView {
    
    var image : UIImage? {
    
        get { return imageView.image}
        set(newVal) { imageView.image = newVal}
    }
    
    var imageContentMode: UIViewContentMode {
    
        get { return imageView.contentMode}
        set(newVal) { imageView.contentMode = newVal}
    }
    
    var verticalCount        : Int!
    var horizontalCount      : Int!
    var fadeDuradtion        : NSTimeInterval! = 1
    var animationGapDuration : NSTimeInterval! = 0.2
    
    /**
     Make the config effective.
     */
    func makeConfigEffective() {
        
        if verticalCount < 1 || horizontalCount < 1 {
            
            return;
        }
        
        if allMaskView != nil {
            
            allMaskView.removeFromSuperview()
        }
        
        countNumArray.removeAll()
        
        allMaskView = UIView(frame: bounds)
        maskView    = allMaskView
        
        let height         = bounds.size.height
        let width          = bounds.size.width
        let maskViewHeight = height / CGFloat(verticalCount)
        let maskViewWidth  = width  / CGFloat(horizontalCount)
        
        var count : Int = 0
        for horizontal in 0 ..< horizontalCount {
            
            for vertical in 0 ..< verticalCount {
                
                let frame                = CGRectMake(maskViewWidth * CGFloat(horizontal), maskViewHeight * CGFloat(vertical), maskViewWidth, maskViewHeight)
                let maskView             = UIView(frame: frame)
                maskView.tag             = maskViewTag + count
                maskView.backgroundColor = UIColor.blackColor()
                allMaskView.addSubview(maskView)
                
                count = count + 1;
            }
        }
        
        maskViewCount = count
        
        for i in 0 ..< maskViewCount {
            
            countNumArray.append(i)
        }
    }
    
    func start(animated animated : Bool, transformTo : TranformFadeViewAnimatedType) {
        
        if animated == true {
            
            let tmpFadeDuradtion = fadeDuradtion        < 0 ? 1.0 : fadeDuradtion
            let tmpGapDuration   = animationGapDuration < 0 ? 0.2 : animationGapDuration
            
            for i in 0 ..< maskViewCount {
                
                let tmpView = allMaskView.viewWithTag(maskViewTag + i)
                
                UIView.animateWithDuration(tmpFadeDuradtion, delay: NSTimeInterval(i) * tmpGapDuration, options: .CurveLinear, animations: {
                    
                    switch transformTo {
                        
                    case .Fade :
                        tmpView?.alpha = 0.0
                        
                    case .Show :
                        tmpView?.alpha = 1.0
                    }
                    
                    }, completion: nil)
            }
            
        } else {
        
            for i in 0 ..< maskViewCount {
                
                let tmpView = allMaskView.viewWithTag(maskViewTag + i)
                
                    switch transformTo {
                        
                    case .Fade :
                        tmpView?.alpha = 0.0
                        
                    case .Show :
                        tmpView?.alpha = 1.0
                    }
            }
        }
    }
    
    private var imageView     : UIImageView!
    private var allMaskView   : UIView!
    private var maskViewCount : Int!
    private var countNumArray : [Int]!
    private var maskViewTag   : Int = 1000
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        imageView                     = UIImageView(frame: bounds)
        imageView.layer.masksToBounds = true
        countNumArray                 = [Int]()
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
