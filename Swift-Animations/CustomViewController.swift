//
//  CustomViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/4.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController, UIGestureRecognizerDelegate {

    /// Screen's width.
    let width  : CGFloat = UIScreen.mainScreen().bounds.size.width
    
    /// Screen's height.
    let height : CGFloat = UIScreen.mainScreen().bounds.size.height
    
    /// You can use this property when this controller is pushed by an UINavigationController.
    var enableInteractivePopGestureRecognizer : Bool? {
        
        get { return (self.navigationController?.interactivePopGestureRecognizer?.enabled)}
        set(newVal) { self.navigationController?.interactivePopGestureRecognizer?.enabled = newVal!}
    }
    
    /**
     Base config.
     */
    func setup() {
    
        self.automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor                      = UIColor.whiteColor()
    }
    
    /**
     You can only use this method when the current controller is an UINavigationController's rootViewController.
     */
    func useInteractivePopGestureRecognizer() {
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    /**
     If this controller is managed by an UINavigationController, you can use this method to pop.
     
     - parameter animated: Animated or not.
     */
    func popViewControllerAnimated(animated : Bool) {
        
        self.navigationController?.popViewControllerAnimated(animated)
    }
    
    /**
     If this controller is managed by an UINavigationController, you can use this method to pop to the rootViewController.
     
     - parameter animated: Animated or not.
     */
    func popToRootViewControllerAnimated(animated : Bool) {
        
        self.navigationController?.popToRootViewControllerAnimated(animated)
    }
    
    // MARK: System method && Debug message.
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setup()
    }
    
    deinit {
    
        print("[❌] '" + String(self.classForCoder) + "' is released.")
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        print("[➡️] enter to   '" + String(self.classForCoder) + "'.")
    }
    
    override func viewDidDisappear(animated: Bool) {
        
        super.viewDidDisappear(animated)
        print("[⛔️] leave from '" + String(self.classForCoder) + "'.")
    }
}

