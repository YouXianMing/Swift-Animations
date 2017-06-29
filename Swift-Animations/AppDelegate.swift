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
         
         Swift version Animations - https://github.com/YouXianMing/Swift-Animations
         
         Lateast no warning version : Xcode 8.3 (8E162)
         
         QQ    705786299
         Email YouXianMing1987@126.com
         
         http://www.cnblogs.com/YouXianMing/
         https://github.com/YouXianMing
         https://github.com/YouXianMing/YoCelsius
         
         AppStore : https://itunes.apple.com/us/app/yocelsius/id967721892?l=zh&ls=1&mt=8
         Video    : http://my.jikexueyuan.com/YouXianMing/record/
         
         */
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            
            window.backgroundColor    = UIColor.white
            let controller            = AnimationsListViewController()
            let rootViewController    = RootNavigationViewController(rootViewController: controller, hideNavBar: true)
            window.rootViewController = rootViewController
            window.makeKey()
        }
        
        return true
    }
}

