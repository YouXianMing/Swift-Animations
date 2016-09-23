//
//  NotificationEvent.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/19.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import Foundation

enum NotificationEvent : Int {
    
    case animationsListViewControllerFirstTimeLoadData
    
    case countDownTimeCellCountDown
    
    func Message() -> String {
        
        switch self {
            
        case .animationsListViewControllerFirstTimeLoadData:
            return "AnimationsListViewControllerFirstTimeLoadData"
            
        case .countDownTimeCellCountDown:
            return "CountDownTimeCellCountDown"
        }
    }
}
