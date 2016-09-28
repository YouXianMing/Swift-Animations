//
//  UIView+ScreensShot.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/9/5.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

extension UIView {

    /**
     Get the view's screen shot, this function may be called from any thread of your app.
     
     - returns: The screen shot's image.
     */
    func screenShot() -> UIImage? {
        
        guard frame.size.height > 0 && frame.size.width > 0 else {
        
            return nil
        }
        
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
