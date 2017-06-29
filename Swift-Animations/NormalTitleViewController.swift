//
//  NormalTitleViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/7.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class NormalTitleViewController: BaseCustomViewController {

    override func setupSubViews() {
     
        // Title label.
        let headlinelabel           = UILabel()
        headlinelabel.font          = UIFont.HeitiSC(20)
        headlinelabel.textAlignment = .center
        headlinelabel.textColor     = UIColor.gray
        headlinelabel.text          = self.title
        headlinelabel.sizeToFit()
        headlinelabel.center        = (self.titleView?.middlePoint)!
        self.titleView?.addSubview(headlinelabel)
        
        // Back button.
        let button                    = UIButton(frame : CGRect(x: 0, y: 0, width: 100, height: 64))
        button.center                 = CGPoint(x: 20, y: self.titleView!.middleY)
        button.imageView?.contentMode = .center
        button.setImage(UIImage(named: "backIcon"),     for: UIControlState())
        button.setImage(UIImage(named: "backIcon_pre"), for: .highlighted)
        self.titleView?.addSubview(button)
        button.addTarget(self, action: #selector(NormalTitleViewController.popSelf), for: .touchUpInside)
        
        // Line view.
        titleView?.addSubview(UIView.CreateLine(CGRect(x: 0, y: titleView!.height - 0.5, width: Width(), height: 0.5), lineColor: UIColor.gray.alpha(0.2)))
    }
    
    func popSelf() {
        
        self.popViewControllerAnimated(true)
    }
}
