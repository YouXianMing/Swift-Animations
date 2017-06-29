//
//  RootNavigationViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/11.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class RootNavigationViewController: BaseCustomNavigationController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let lauchImageView   = UIImageView(frame: self.view.bounds)
        lauchImageView.image = AppleSystemService.launchImage()
        view.addSubview(lauchImageView)
        
        UIView.animate(withDuration: 1, delay: 1, options: UIViewAnimationOptions(), animations: {
            
            lauchImageView.scale = 1.3
            lauchImageView.alpha = 0
            
        }) { (finished) in
            
            lauchImageView.removeFromSuperview()
            DefaultNotificationCenter.PostMessageTo(NotificationEvent.animationsListViewControllerFirstTimeLoadData.Message())
        }
    }
}
