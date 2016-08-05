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

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window                     = UIWindow(frame: UIScreen.mainScreen().bounds)
        let controller                  = AnimationsListViewController()
        let navigationController        = CustomNavigationController(rootViewController: controller, hideTabBar: true)
        
        self.window?.rootViewController = navigationController
        self.window?.backgroundColor = UIColor.whiteColor()
        self.window?.makeKeyWindow()
        
        return true
    }
}

