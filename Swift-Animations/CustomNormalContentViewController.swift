//
//  CustomNormalContentViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/5.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class CustomNormalContentViewController: CustomViewController {
    
    //  level            view            frame
    //  ---------------------------------------------------------------
    //
    //  highest          windowView      0 x  0 x width x height
    //
    //  higher           loadingView     0 x 64 x width x (height - 64)
    //
    //  high             titleView       0 x  0 x width x 64
    //
    //  high             contentView     0 x 64 x width x (height - 64)
    //
    //  normal           backgroundView  0 x  0 x width x height
    //
    //  low              view            0 x  0 x width x height
    
    var windowView     : UIView?
    var loadingView    : UIView?
    var titleView      : UIView?
    var contentView    : UIView?
    var backgroundView : UIView?
    
    override func setup() {
        
        super.setup()
        
        buildBackgroundView()
        buildContentView()
        buildTitleView()
        buildLoadingView()
        buildWindowView()
        
        loadingView?.isUserInteractionEnabled = false
        windowView?.isUserInteractionEnabled  = false
    }
    
    /**
     Build backgroundView, please overwrite by subclass.
     */
    func buildBackgroundView() {
        
        backgroundView = UIView(frame : CGRect(x: 0, y: 0, width: width, height: height))
        view.addSubview(backgroundView!)
    }
    
    /**
     Build titleView, please overwrite by subclass.
     */
    func buildTitleView() {
        
        titleView = UIView(frame : CGRect(x: 0, y: 0, width: width, height: 64))
        view.addSubview(titleView!)
    }
    
    /**
     Build contentView, please overwrite by subclass.
     */
    func buildContentView() {
        
        contentView = UIView(frame : CGRect(x: 0, y: 64, width: width, height: height - 64))
        view.addSubview(contentView!)
    }
    
    /**
     Build loadingView, please overwrite by subclass.
     */
    func buildLoadingView() {
        
        loadingView = UIView(frame : CGRect(x: 0, y: 64, width: width, height: height - 64))
        view.addSubview(loadingView!)
    }
    
    /**
     Build windowView, please overwrite by subclass.
     */
    func buildWindowView() {
        
        windowView = UIView(frame : CGRect(x: 0, y: 0, width: width, height: height))
        view.addSubview(windowView!)
    }
}



