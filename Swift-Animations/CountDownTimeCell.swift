//
//  CountDownTimeCell.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/9/4.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class CountDownTimeCell: CustomCell, DefaultNotificationCenterDelegate {

    fileprivate var titleLabel         : UILabel!
    fileprivate var countdownLabel     : UILabel!
    fileprivate var notificationCenter : DefaultNotificationCenter = DefaultNotificationCenter()

    override func setupCell() {
        
        notificationCenter.addNotificationName(NotificationEvent.countDownTimeCellCountDown.Message())
        notificationCenter.delegate = self
    }
    
    override func buildSubview() {
        
        titleLabel           = UILabel(frame: CGRect(x: 15, y: 10, width: Width() - 20, height: 40))
        titleLabel.textColor = UIColor.gray
        titleLabel.font      = UIFont.AvenirLight(20.0)
        addSubview(titleLabel)
        
        countdownLabel               = UILabel(frame: CGRect(x: 10, y: 10, width: Width() - 20, height: 40))
        countdownLabel.textColor     = UIColor.gray
        countdownLabel.font          = UIFont.AvenirLight(15.0)
        countdownLabel.textAlignment = .right
        addSubview(countdownLabel)
    }

    override func loadContent() {
        
        if let model = dataAdapter?.data as? TimeModel {
            
            titleLabel.text     = model.title
            countdownLabel.text = model.currentTimeString
        }
    }
    
    func defaultNotificationCenter(_ notificationName: String, object: AnyObject?) {
        
        if display == true && notificationName == NotificationEvent.countDownTimeCellCountDown.Message() {
            
            loadContent()
        }
    }
}
