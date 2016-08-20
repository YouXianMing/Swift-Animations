//
//  NormalTitleViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/7.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class NormalTitleViewController: CustomNormalContentViewController {

    override func buildTitleView() {
        
        super.buildTitleView()
        
        // Title label.
        let headlinelabel           = UILabel()
        headlinelabel.font          = UIFont.HeitiSC(20)
        headlinelabel.textAlignment = .Center
        headlinelabel.textColor     = UIColor.grayColor()
        headlinelabel.text          = self.title
        headlinelabel.sizeToFit()
        headlinelabel.center        = (self.titleView?.middlePoint)!
        self.titleView?.addSubview(headlinelabel)
        
        // Back button.
        let button                    = UIButton(frame : CGRectMake(0, 0, 100, 64))
        button.center                 = CGPointMake(20, self.titleView!.middleY)
        button.imageView?.contentMode = .Center
        button.setImage(UIImage(named: "backIcon"),     forState: .Normal)
        button.setImage(UIImage(named: "backIcon_pre"), forState: .Highlighted)
        self.titleView?.addSubview(button)
        button.addTarget(self, action: #selector(NormalTitleViewController.popSelf), forControlEvents: .TouchUpInside)
        
        // Line view.
        titleView?.addSubview(UIView.CreateLine(CGRectMake(0, titleView!.height - 0.5, Width(), 0.5), lineColor: UIColor.grayColor().alpha(0.2)))
    }
    
    func popSelf() {
        
        self.popViewControllerAnimated(true)
    }
}
