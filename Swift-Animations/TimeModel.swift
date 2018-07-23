//
//  TimeModel.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/9/4.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class TimeModel: NSObject {
    
    var title         : String? = ""
    var countdownTime : Int?    = 0
    
    var currentTimeString : String? {
    
        get {
        
            if let val = countdownTime {
                
                if val <= 0 {
                
                    return "00:00:00"
                    
                } else {
                    
                    return String(format:"%02.f:%02.f:%02.f",
                                  CGFloat(val) / 3600,
                                  CGFloat(val).truncatingRemainder(dividingBy: 3600) / 60,
                                  CGFloat(val).truncatingRemainder(dividingBy: 60))
                }
                
            } else {
                
                return Optional.none
            }
        }
    }
    
    convenience init(title : String, countdownTime : Int) {
        
        self.init()
        self.title         = title
        self.countdownTime = countdownTime
    }
    
    func countDown() {
        
        countdownTime = countdownTime! - 1
    }
}
