//
//  BaseMessageView.swift
//  Swift-Animations
//
//  Created by YouXianMing on 2017/9/13.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

import UIKit

// MARK: protocol CustomCellDelegate

protocol BaseMessageViewDelegate : class {
    
    func baseMessageView(_ messageView : BaseMessageView, event : AnyObject?)
    func baseMessageViewWillAppear(_ messageView : BaseMessageView)
    func baseMessageViewDidAppear(_ messageView : BaseMessageView)
    func baseMessageViewWillDisappear(_ messageView : BaseMessageView)
    func baseMessageViewDidDisappear(_ messageView : BaseMessageView)
}

class BaseMessageView: UIView {
    
    // MARK: Properties
    
    /// The delegate.
    weak var delegate : BaseMessageViewDelegate?
    
    /// The message object.
    var messageObject : AnyObject?
    
    /// The contentView.
    var contentView : UIView? {
        
        get { return private_ContentView}
        set(newVal) {
            
            self.frame = (newVal != nil ? (newVal?.bounds)! : CGRect.zero)
            private_ContentView = newVal
        }
    }
    private weak var private_ContentView : UIView?
    
    /// Auto hiden or not, default is YES.
    var autoHiden : Bool = true
    
    /// If The autoHiden is YES, you should set the delay hiden duration, default is 2.0.
    var delayAutoHidenDuration : TimeInterval {
        
        get { return private_DelayAutoHidenDuration}
        set(newVal) {
            
            private_DelayAutoHidenDuration = (newVal <= 0 ? 0 : newVal)
        }
    }
    private var private_DelayAutoHidenDuration : TimeInterval = 2.0
    
    // MARK: Init related.
    
    required override init(frame : CGRect) {
        
        super.init(frame: CGRect.zero)
    }
    
    required convenience init() {
        
        self.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        
        print(String(describing: self.classForCoder) + " is released.")
    }
    
    class func Setup(messageObject                     : AnyObject?               = nil,
                     contentView                       : UIView?                  = nil,
                     delegate                          : BaseMessageViewDelegate? = nil,
                     autoHiden                         : Bool                     = true,
                     delayAutoHidenDuration            : TimeInterval             = 2.0) -> Self {
        
        let messageView = self.init(frame: CGRect.zero)
        
        messageView.messageObject                     = messageObject
        messageView.contentView                       = contentView
        messageView.delegate                          = delegate
        messageView.autoHiden                         = autoHiden
        messageView.delayAutoHidenDuration            = delayAutoHidenDuration
        
        return messageView
    }
    
    // MARK: Useful methods.
    
    /// Show the MessageView.
    final func show() {
        
        if (self.contentView != nil) {
            
            self.contentView?.addSubview(self)
            setupSubViews()
            beginShowAnimation()
            
            if autoHiden {
                
                let dispatchTime = DispatchTime.now() + delayAutoHidenDuration
                DispatchQueue.main.asyncAfter( deadline: dispatchTime ) {
                    
                    self.hide()
                }
            }
        }
    }
    
    /// Hide the MessageView.
    final func hide() {
        
        beginHideAnimation()
    }
    
    // MARK: Overwrite by subClass.
    
    /// Begin show animation.
    func beginShowAnimation() {
        
        beforeStartShowValueConfig()
        delegate?.baseMessageViewWillAppear(self)
        UIView.animate(withDuration: 0.3, delay: 0, options: .beginFromCurrentState, animations: {
            
            self.startShowAnimated()
            
        }) { (success) in
            
            self.delegate?.baseMessageViewDidAppear(self)
        }
    }
    
    /// Begin hide animation.
    func beginHideAnimation() {
        
        delegate?.baseMessageViewWillDisappear(self)
        UIView.animate(withDuration: 0.3, delay: 0, options: .beginFromCurrentState, animations: {
            
            self.startHideAnimated()
            
        }) { (success) in
            
            self.afterHideShowValueConfig()
            self.delegate?.baseMessageViewDidDisappear(self)
            self.removeFromSuperview()
        }
    }
    
    /// Add subviews to self.
    func setupSubViews() {
        
    }
    
    /// Before start show animated, you can do sth value config.
    func beforeStartShowValueConfig() {
        
    }
    
    /// Start show animated.
    func startShowAnimated() {
        
    }
    
    /// Start hide animated.
    func startHideAnimated() {
        
    }
    
    /// After hide animation is complete, you can do sth value config.
    func afterHideShowValueConfig() {
        
    }
}
