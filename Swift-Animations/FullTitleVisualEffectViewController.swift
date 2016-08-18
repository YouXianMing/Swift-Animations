//
//  FullTitleVisualEffectViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/18.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class FullTitleVisualEffectViewController: CustomFullContentViewController {

    private var effectView         : UIVisualEffectView!
    private var vibrancyEffectView : UIVisualEffectView!
    
    override func buildTitleView() {
        
        super.buildTitleView()

        effectView                        = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        effectView.userInteractionEnabled = true
        effectView.frame                  = (titleView?.bounds)!
        titleView?.addSubview(effectView)
        
        vibrancyEffectView       = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: effectView.effect as! UIBlurEffect))
        vibrancyEffectView.frame = effectView.bounds
        effectView.contentView.addSubview(vibrancyEffectView)
        
        let backButton    = UIButton(frame: CGRectMake(0, 0, 100, 64))
        backButton.center = CGPointMake(20, titleView!.middleY)
        backButton.setImage(UIImage(named: "backIconTypeTwo"),     forState: .Normal)
        backButton.setImage(UIImage(named: "backIconTypeTwo_pre"), forState: .Highlighted)
        backButton.addTarget(self, action: #selector(FullTitleVisualEffectViewController.popSelf), forControlEvents: .TouchUpInside)
        
        let headlineLabel           = UILabel()
        headlineLabel.font          = UIFont.HeitiSC(20)
        headlineLabel.textAlignment = .Center
        headlineLabel.textColor     = UIColor(red: 0.329, green: 0.329, blue: 0.329, alpha: 1)
        headlineLabel.text          = title
        headlineLabel.sizeToFit()
        headlineLabel.center        = (titleView?.middlePoint)!
        vibrancyEffectView.contentView.addSubview(backButton)
        vibrancyEffectView.contentView.addSubview(headlineLabel)
    }
    
    func popSelf() {
        
        self.popViewControllerAnimated(true)
    }
}
