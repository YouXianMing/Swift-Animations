//
//  NormalTitleViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/7.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class NormalTitleViewController: BaseCustomViewController {

    override func makeViewsConfig(viewsConfig: [String : ControllerBaseViewConfig]) {
        
        /// iPhoneX
        if Screen.CurrentScreen == Screen._375x812 {
            
            let titleViewConfig    = viewsConfig[titleViewId]
            titleViewConfig?.frame = CGRect.init(x: 0, y: 0, width: Screen.Width, height: 64 + additionaliPhoneXTopSafeHeight)
            
            let contentViewConfig    = viewsConfig[contentViewId]
            contentViewConfig?.frame = CGRect.init(x: 0, y: 64 + additionaliPhoneXTopSafeHeight, width: Screen.Width, height: Screen.Height - (64 + additionaliPhoneXTopSafeHeight))
        }
    }
    
    override func setupSubViews() {
     
        // Title label.
        let headlinelabel           = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: Screen.Width, height: 64))
        headlinelabel.font          = UIFont.HeitiSC(20)
        headlinelabel.textAlignment = .center
        headlinelabel.textColor     = UIColor.gray
        headlinelabel.text          = self.title
        headlinelabel.bottom        = (self.titleView?.height)!
        self.titleView?.addSubview(headlinelabel)
        
        // Back button.
        let button                    = UIButton(frame : CGRect(x: 0, y: 0, width: 100, height: 64))
        button.center                 = CGPoint(x: 20, y: headlinelabel.centerY)
        button.imageView?.contentMode = .center
        button.setImage(UIImage(named: "backIcon"),     for: UIControl.State())
        button.setImage(UIImage(named: "backIcon_pre"), for: .highlighted)
        self.titleView?.addSubview(button)
        button.addTarget(self, action: #selector(NormalTitleViewController.popSelf), for: .touchUpInside)
        
        // Line view.
        titleView?.addSubview(UIView.CreateLine(CGRect(x: 0, y: titleView!.height - 0.5, width: Screen.Width, height: 0.5), lineColor: UIColor.gray.alpha(0.2)))
    }
    
    @objc func popSelf() {
        
        self.popViewControllerAnimated(true)
    }
}
