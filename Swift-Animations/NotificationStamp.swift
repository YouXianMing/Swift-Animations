//
//  NotificationStamp.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/19.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import Foundation

enum NotificationEvent : Int {
    
    case AnimationsListViewControllerFirstTimeLoadData
    
    case CountDownTimeCellCountDown
    
    func Message() -> String {
        
        switch self {
            
        case .AnimationsListViewControllerFirstTimeLoadData:
            return "AnimationsListViewControllerFirstTimeLoadData"
            
        case CountDownTimeCellCountDown:
            return "CountDownTimeCellCountDown"
        }
    }
}