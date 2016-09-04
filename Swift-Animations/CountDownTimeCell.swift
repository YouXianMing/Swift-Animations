//
//  CountDownTimeCell.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/9/4.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class CountDownTimeCell: CustomCell, DefaultNotificationCenterDelegate {

    private var titleLabel         : UILabel!
    private var countdownLabel     : UILabel!
    private var notificationCenter : DefaultNotificationCenter = DefaultNotificationCenter()

    override func setupCell() {
        
        notificationCenter.addNotificationName(NotificationEvent.CountDownTimeCellCountDown.Message())
        notificationCenter.delegate = self
    }
    
    override func buildSubview() {
        
        titleLabel           = UILabel(frame: CGRectMake(15, 10, Width() - 20, 40))
        titleLabel.textColor = UIColor.grayColor()
        titleLabel.font      = UIFont.AvenirLight(20.0)
        addSubview(titleLabel)
        
        countdownLabel               = UILabel(frame: CGRectMake(10, 10, Width() - 20, 40))
        countdownLabel.textColor     = UIColor.grayColor()
        countdownLabel.font          = UIFont.AvenirLight(15.0)
        countdownLabel.textAlignment = .Right
        addSubview(countdownLabel)
    }

    override func loadContent() {
        
        if let model = dataAdapter?.data as? TimeModel {
            
            titleLabel.text     = model.title
            countdownLabel.text = model.currentTimeString
        }
    }
    
    func defaultNotificationCenter(notificationName: String, object: AnyObject?) {
        
        if display == true && notificationName == NotificationEvent.CountDownTimeCellCountDown.Message() {
            
            loadContent()
        }
    }
}
