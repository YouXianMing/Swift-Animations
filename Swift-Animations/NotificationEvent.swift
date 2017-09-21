//
//  NotificationEvent.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/19.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import Foundation

enum NotificationEvent : String {
    
    case animationsListViewControllerFirstTimeLoadData = "animationsListViewControllerFirstTimeLoadData"
    case countDownTimeCellCountDown                    = "countDownTimeCellCountDown"
    
    var notificationName : String {
        
        get { return self.rawValue}
    }
}
