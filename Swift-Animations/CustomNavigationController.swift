//
//  CustomNavigationController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/4.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    /**
     Init with rootViewController.
     
     - parameter rootViewController: An UIViewController used as rootViewController.
     - parameter hideTabBar:         Navigation bar hide or not.
     
     - returns: CustomNavigationController object.
     */
    convenience init(rootViewController: CustomViewController, hideTabBar : Bool) {
        
        self.init(rootViewController : rootViewController)
        rootViewController.useInteractivePopGestureRecognizer()
        setNavigationBarHidden(hideTabBar, animated: false)
    }
}
