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
    let width  : CGFloat = UIScreen.main.bounds.size.width
    
    /// Screen's height.
    let height : CGFloat = UIScreen.main.bounds.size.height
    
    /// You can use this property when this controller is pushed by an UINavigationController.
    var enableInteractivePopGestureRecognizer : Bool? {
        
        get { return (self.navigationController?.interactivePopGestureRecognizer?.isEnabled)}
        set(newVal) { self.navigationController?.interactivePopGestureRecognizer?.isEnabled = newVal!}
    }
    
    /**
     Base config.
     */
    func setup() {
    
        self.automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor                      = UIColor.white
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
    func popViewControllerAnimated(_ animated : Bool) {
        
        _ = self.navigationController?.popViewController(animated: animated)
    }
    
    /**
     If this controller is managed by an UINavigationController, you can use this method to pop to the rootViewController.
     
     - parameter animated: Animated or not.
     */
    func popToRootViewControllerAnimated(_ animated : Bool) {
        
        _ = self.navigationController?.popToRootViewController(animated: animated)
    }
    
    // MARK: System method && Debug message.
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setup()
    }
    
    deinit {
    
        print("[❌] '" + String(describing: self.classForCoder) + "' is released.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        print("[➡️] enter to --> '" + String(describing: self.classForCoder) + "'.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        print("[🕒] leave from <-- '" + String(describing: self.classForCoder) + "'.")
    }
}

