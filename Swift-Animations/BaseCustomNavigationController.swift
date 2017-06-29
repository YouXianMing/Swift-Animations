//
//  BaseCustomNavigationController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 2017/6/29.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

import UIKit

class BaseCustomNavigationController: UINavigationController {

    /// Init with rootViewController.
    ///
    /// - Parameters:
    ///   - rootViewController: An UIViewController used as rootViewController.
    ///   - hideTabBar: Navigation bar hide or not.
    convenience init(rootViewController: BaseCustomViewController, hideNavBar : Bool) {
        
        self.init(rootViewController : rootViewController)
        rootViewController.useInteractivePopGestureRecognizer()
        setNavigationBarHidden(hideNavBar, animated: false)
    }
    
    // MARK: -- System method && Debug message --
    
    deinit {
        
        print("[❌] '[NAV] " + String(describing: self.classForCoder) + "' is released.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        print("[➡️] enter to --> '[NAV] " + String(describing: self.classForCoder) + "'.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        print("[🕒] leave from <-- '[NAV] " + String(describing: self.classForCoder) + "'.")
    }
}
