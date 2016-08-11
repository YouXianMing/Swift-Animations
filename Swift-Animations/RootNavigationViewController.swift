//
//  RootNavigationViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/11.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class RootNavigationViewController: CustomNavigationController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let lauchImageView   = UIImageView(frame: self.view.bounds)
        lauchImageView.image = AppleSystemService.launchImage()
        view.addSubview(lauchImageView)
        
        UIView.animateWithDuration(1, delay: 2, options: .CurveEaseInOut, animations: {
            
            lauchImageView.scale = 1.2
            lauchImageView.alpha = 0
            
        }) { (finished) in
            
            lauchImageView.removeFromSuperview()
        }
    }
}
