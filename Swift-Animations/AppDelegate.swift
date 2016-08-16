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

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        if let window = window {
            
            window.backgroundColor    = UIColor.whiteColor()
            let controller            = AnimationsListViewController()
            let rootViewController    = RootNavigationViewController(rootViewController: controller, hideTabBar: true)
            window.rootViewController = rootViewController
            window.makeKeyWindow()
        }
        
        return true
    }
}

