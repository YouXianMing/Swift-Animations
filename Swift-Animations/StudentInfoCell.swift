//
//  StudentInfoCell.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/9.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class StudentInfoCell: CustomCell {

    private var nameLabel : UILabel!
    private var ageLabel  : UILabel!
    
    override func setupCell() {
        
        self.selectionStyle = .None
    }
    
    override func buildSubview() {
        
        nameLabel      = UILabel(frame: CGRectMake(20, 0, 200, 60))
        nameLabel.font = UIFont.AppleSDGothicNeoThin(20)
        self.addSubview(nameLabel)
        
        ageLabel               = UILabel(frame: CGRectMake(Width() - 220, 0, 200, 60))
        ageLabel.textAlignment = .Right
        ageLabel.font          = UIFont.AppleSDGothicNeoThin(20)
        self.addSubview(ageLabel)
        
        self.addSubview(UIView.CreateLine(CGRectMake(0, 59.5, Width(), 0.5), lineColor: UIColor.grayColor().alpha(0.1)))
    }
    
    override func loadContent() {
        
        let model = data as! StudentModel
        
        nameLabel.text = model.name
        ageLabel.text  = model.age.stringValue
    }
    
    override func selectedEvent() {
        
        showSelectedAnimation()
    }
    
    private func showSelectedAnimation() {
        
        let tempView             = UIView(frame: CGRectMake(0, 0, Width(), 60))
        tempView.backgroundColor = UIColor.cyanColor().alpha(0.2)
        tempView.alpha           = 0
        self.addSubview(tempView)
        
        UIView.animateWithDuration(0.2, delay: 0, options: .CurveEaseIn, animations: {
            
            tempView.alpha = 0.8
            
        }) { (finished) in
            
            UIView.animateWithDuration(0.2, delay: 0.1, options: .CurveEaseOut, animations: {
                
                tempView.alpha = 0
                
                }, completion: { (finished) in
                    
                    tempView.removeFromSuperview()
            })
        }
    }
}
