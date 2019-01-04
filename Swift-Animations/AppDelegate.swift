//
//  AppDelegate.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/4.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        /*
         Lateast no warning version : Xcode 9.4.1 (9F2000)
         */

        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            
            window.backgroundColor    = UIColor.white
            let controller            = AnimationsListViewController()
            let rootViewController    = RootNavigationViewController(rootViewController: controller, hideNavBar: true)
            window.rootViewController = rootViewController
            window.makeKeyAndVisible()
        }
        
        return true
    }
}

