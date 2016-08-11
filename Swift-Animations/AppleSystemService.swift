//
//  AppleSystemService.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/11.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class AppleSystemService : NSObject {
    
    /**
     Get the lauch image.
     
     - returns: The lauch image.
     */
    class func launchImage() -> UIImage {
        
        var lauchImage      : UIImage!
        var viewOrientation : String!
        let viewSize        = UIScreen.mainScreen().bounds.size
        let orientation     = UIApplication.sharedApplication().statusBarOrientation
        
        if orientation == .LandscapeLeft || orientation == .LandscapeRight {
            
            viewOrientation = "Landscape"
            
        } else {
            
            viewOrientation = "Portrait"
        }
        
        let imagesInfoArray = NSBundle.mainBundle().infoDictionary!["UILaunchImages"]
        for dict : Dictionary <String, String> in imagesInfoArray as! Array {
            
            let imageSize = CGSizeFromString(dict["UILaunchImageSize"]!)
            if CGSizeEqualToSize(imageSize, viewSize) && viewOrientation == dict["UILaunchImageOrientation"]! as String {
                
                lauchImage = UIImage(named: dict["UILaunchImageName"]!)
            }
        }
        
        return lauchImage
    }
}