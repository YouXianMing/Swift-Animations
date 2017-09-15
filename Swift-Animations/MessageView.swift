//
//  MessageView.swift
//  Swift-Animations
//
//  Created by YouXianMing on 2017/9/13.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

import UIKit

class MessageView: BaseMessageView {
    
    fileprivate var blackBackgroundView : UIView!
    fileprivate var blackView           : UIView!
    fileprivate var label               : UILabel!

    required init(frame : CGRect) {
        
        super.init(frame: CGRect.zero)
    }
    
    required convenience init() {
        
        self.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubViews() {
        
        blackBackgroundView                 = UIView.init(frame: (contentView?.bounds)!)
        blackBackgroundView.backgroundColor = UIColor.black
        blackBackgroundView.alpha           = 0
        self.addSubview(blackBackgroundView)
        
        blackView                 = UIView.init()
        blackView.backgroundColor = UIColor.black.alpha(0.65)
        self.addSubview(blackView)
        
        label               = UILabel.init()
        label.numberOfLines = 0
        label.font          = UIFont.HeitiSC(15)
        label.textColor     = UIColor.white
        label.text          = self.messageObject as? String
        label.width         = Width() / 4 * 3
        label.sizeToFit()
        blackView.addSubview(label)
        
        blackView.bounds = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: label.width + 15, height: label.height + 15))
        label.center     = blackView.middlePoint
        blackView.center = self.middlePoint
        blackView.alpha  = 0
        blackView.scale  = 1.5
    }
    
    override func beginShowAnimation() {
        
        beforeStartShowValueConfig()
        delegate?.baseMessageViewWillAppear(self)
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.35, initialSpringVelocity: 0.9, options: .beginFromCurrentState, animations: {
            
            self.blackView.scale = 1
            
        }) { (success) in
            
            self.delegate?.baseMessageViewDidAppear(self)
        }
        
        UIView.animate(withDuration: 0.3) { 
            
            self.blackBackgroundView.alpha = 0.1
            self.blackView.alpha           = 1
        }
    }
    
    override func startHideAnimated() {
        
        self.blackBackgroundView.alpha = 0
        blackView.alpha                = 0
    }
}
