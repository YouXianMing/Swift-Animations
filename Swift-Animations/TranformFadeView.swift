//
//  TranformFadeView.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/20.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

enum TranformFadeViewAnimatedType : Int {
    
    case fade, show
}

// MARK: TranformFadeView

class TranformFadeView: UIView {
    
    // MARK: Convenience init.
    
    convenience init(frame: CGRect, verticalCount : Int, horizontalCount : Int, fadeDuradtion : TimeInterval, animationGapDuration : TimeInterval) {
        
        self.init(frame: frame)
        self.verticalCount        = verticalCount
        self.horizontalCount      = horizontalCount
        self.fadeDuradtion        = fadeDuradtion
        self.animationGapDuration = animationGapDuration
        self.makeConfigEffective()
    }
    
    // MARK: Properies & funcs.
    
    /// The content imageView's image.
    var image : UIImage? {
        
        get { return imageView.image}
        set(newVal) { imageView.image = newVal}
    }
    
    /// The content imageView's contentMode.
    var imageContentMode: UIViewContentMode {
        
        get { return imageView.contentMode}
        set(newVal) { imageView.contentMode = newVal}
    }
    
    /// Vertical direction view's count, default is 3.
    var verticalCount        : Int = 3
    
    /// Horizontal direction view's count, default is 4.
    var horizontalCount      : Int = 4
    
    /// One of the maskView's animation duration, default is 1.0
    var fadeDuradtion        : TimeInterval = 1
    
    /// The animation duration two subViews from allMaskView, default is 0.2
    var animationGapDuration : TimeInterval = 0.2
    
    /**
     Make the config effective.
     */
    func makeConfigEffective() {
        
        guard verticalCount >= 1 && horizontalCount >= 1 else {
            
            return
        }
        
        if allMaskView != nil {
            
            allMaskView.removeFromSuperview()
        }
        
        countNumArray.removeAll()
        
        allMaskView = UIView(frame: bounds)
        mask    = allMaskView
        
        let height         = bounds.size.height
        let width          = bounds.size.width
        let maskViewHeight = height / CGFloat(verticalCount)
        let maskViewWidth  = width  / CGFloat(horizontalCount)
        
        var count : Int = 0
        for horizontal in 0 ..< horizontalCount {
            
            for vertical in 0 ..< verticalCount {
                
                let frame                = CGRect(x: maskViewWidth * CGFloat(horizontal), y: maskViewHeight * CGFloat(vertical), width: maskViewWidth, height: maskViewHeight)
                let maskView             = UIView(frame: frame)
                maskView.tag             = maskViewTag + count
                maskView.backgroundColor = UIColor.black
                allMaskView.addSubview(maskView)
                
                count = count + 1;
            }
        }
        
        maskViewCount = count
        
        for i in 0 ..< maskViewCount {
            
            countNumArray.append(i)
        }
    }
    
    /**
     Start transform to fade or show state.
     
     - parameter animated:    Animated or not.
     - parameter transformTo: Show or fade.
     */
    func start(animated : Bool, transformTo : TranformFadeViewAnimatedType) {
        
        if animated == true {
            
            let tmpFadeDuradtion = fadeDuradtion        < 0 ? 1.0 : fadeDuradtion
            let tmpGapDuration   = animationGapDuration < 0 ? 0.2 : animationGapDuration
            
            for i in 0 ..< maskViewCount {
                
                let tmpView = allMaskView.viewWithTag(maskViewTag + i)
                
                UIView.animate(withDuration: tmpFadeDuradtion, delay: TimeInterval(i) * tmpGapDuration, options: .curveLinear, animations: {
                    
                    switch transformTo {
                        
                    case .fade :
                        tmpView?.alpha = 0.0
                        
                    case .show :
                        tmpView?.alpha = 1.0
                    }
                    
                    }, completion: nil)
            }
            
        } else {
            
            for i in 0 ..< maskViewCount {
                
                let tmpView = allMaskView.viewWithTag(maskViewTag + i)
                
                switch transformTo {
                    
                case .fade :
                    tmpView?.alpha = 0.0
                    
                case .show :
                    tmpView?.alpha = 1.0
                }
            }
        }
    }
    
    // MARK: System methods & Private properties
    
    fileprivate var imageView     : UIImageView!
    fileprivate var allMaskView   : UIView!
    fileprivate var maskViewCount : Int!
    fileprivate var countNumArray : [Int]!
    fileprivate var maskViewTag   : Int = 1000
    
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
