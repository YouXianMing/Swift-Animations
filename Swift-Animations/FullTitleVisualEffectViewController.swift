//
//  FullTitleVisualEffectViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/18.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class FullTitleVisualEffectViewController: BaseCustomViewController {

    fileprivate var effectView         : UIVisualEffectView!
    fileprivate var vibrancyEffectView : UIVisualEffectView!
    
    override func setupSubViews() {
    
        effectView                          = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        effectView.isUserInteractionEnabled = true
        effectView.frame                    = (titleView?.bounds)!
        titleView?.addSubview(effectView)
        
        vibrancyEffectView       = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: effectView.effect as! UIBlurEffect))
        vibrancyEffectView.frame = effectView.bounds
        effectView.contentView.addSubview(vibrancyEffectView)
        
        let backButton    = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 64))
        backButton.center = CGPoint(x: 20, y: titleView!.middleY)
        backButton.setImage(UIImage(named: "backIconTypeTwo"),     for: UIControlState())
        backButton.setImage(UIImage(named: "backIconTypeTwo_pre"), for: .highlighted)
        backButton.addTarget(self, action: #selector(FullTitleVisualEffectViewController.popSelf), for: .touchUpInside)
        
        let headlineLabel           = UILabel()
        headlineLabel.font          = UIFont.HeitiSC(20)
        headlineLabel.textAlignment = .center
        headlineLabel.textColor     = UIColor(red: 0.329, green: 0.329, blue: 0.329, alpha: 1)
        headlineLabel.text          = title
        headlineLabel.sizeToFit()
        headlineLabel.center        = (titleView?.middlePoint)!
        vibrancyEffectView.contentView.addSubview(backButton)
        vibrancyEffectView.contentView.addSubview(headlineLabel)
    }
    
    override func makeViewsConfig(viewsConfig: [String : ControllerBaseViewConfig]) {
        
        let contentViewConfig    = viewsConfig[contentViewId];
        contentViewConfig?.frame = CGRect(x: 0, y: 0, width: Width(), height: Height());
    }
    
    func popSelf() {
        
        self.popViewControllerAnimated(true)
    }
}
