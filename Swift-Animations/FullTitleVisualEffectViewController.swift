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
        
        let headlineLabel           = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: Screen.Width, height: 64))
        headlineLabel.font          = UIFont.HeitiSC(20)
        headlineLabel.textAlignment = .center
        headlineLabel.textColor     = UIColor(red: 0.329, green: 0.329, blue: 0.329, alpha: 1)
        headlineLabel.text          = title
        headlineLabel.bottom        = effectView.height
        
        let backButton    = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 64))
        backButton.center = CGPoint(x: 20, y: headlineLabel.centerY)
        backButton.setImage(UIImage(named: "backIconTypeTwo"),     for: .normal)
        backButton.setImage(UIImage(named: "backIconTypeTwo_pre"), for: .highlighted)
        backButton.addTarget(self, action: #selector(FullTitleVisualEffectViewController.popSelf), for: .touchUpInside)
        
        vibrancyEffectView.contentView.addSubview(backButton)
        vibrancyEffectView.contentView.addSubview(headlineLabel)
    }
    
    override func makeViewsConfig(viewsConfig: [String : ControllerBaseViewConfig]) {
        
        let contentViewConfig    = viewsConfig[contentViewId];
        contentViewConfig?.frame = CGRect(x: 0, y: 0, width: Screen.Width, height: Screen.Height);
        
        /// iPhoneX
        if Screen.CurrentScreen == Screen._375x812 {
            
            let titleViewConfig    = viewsConfig[titleViewId]
            titleViewConfig?.frame = CGRect.init(x: 0, y: 0, width: Screen.Width, height: 64 + additionaliPhoneXTopSafeHeight)
        }
    }
    
    @objc func popSelf() {
        
        self.popViewControllerAnimated(true)
    }
}
