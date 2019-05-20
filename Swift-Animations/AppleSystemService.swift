//
//  AppleSystemService.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/11.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class AppleSystemService : NSObject {
    
    /// Get the lauch image.
    class var LaunchImage : UIImage {
        
        get {
            
            var lauchImage      : UIImage!
            var viewOrientation : String!
            let viewSize        = UIScreen.main.bounds.size
            let orientation     = UIApplication.shared.statusBarOrientation
            
            if orientation == .landscapeLeft || orientation == .landscapeRight {
                
                viewOrientation = "Landscape"
                
            } else {
                
                viewOrientation = "Portrait"
            }
            
            let imagesInfoArray = Bundle.main.infoDictionary!["UILaunchImages"]
            for dict : Dictionary <String, String> in imagesInfoArray as! Array {
                
                let imageSize = NSCoder.cgSize(for: dict["UILaunchImageSize"]!)
                if imageSize.equalTo(viewSize) && viewOrientation == dict["UILaunchImageOrientation"]! as String {
                    
                    lauchImage = UIImage(named: dict["UILaunchImageName"]!)
                }
            }
            
            return lauchImage
        }
    }
}
