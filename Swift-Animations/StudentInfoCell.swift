//
//  StudentInfoCell.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/9.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class StudentInfoCell: CustomCell {

    fileprivate var nameLabel : UILabel!
    fileprivate var ageLabel  : UILabel!
    
    override func setupCell() {
        
        self.selectionStyle = .none
    }
    
    override func buildSubview() {
        
        nameLabel      = UILabel(frame: CGRect(x: 20, y: 0, width: 200, height: 60))
        nameLabel.font = UIFont.AppleSDGothicNeoThin(20)
        self.addSubview(nameLabel)
        
        ageLabel               = UILabel(frame: CGRect(x: Width() - 220, y: 0, width: 200, height: 60))
        ageLabel.textAlignment = .right
        ageLabel.font          = UIFont.AppleSDGothicNeoThin(20)
        self.addSubview(ageLabel)
        
        self.addSubview(UIView.CreateLine(CGRect(x: 0, y: 59.5, width: Width(), height: 0.5), lineColor: UIColor.gray.alpha(0.1)))
    }
    
    override func loadContent() {
        
        let model = data as! StudentModel
        
        nameLabel.text = model.name
        ageLabel.text  = model.age.stringValue
    }
    
    override func selectedEvent() {
        
        showSelectedAnimation()
    }
    
    fileprivate func showSelectedAnimation() {
        
        let tempView             = UIView(frame: CGRect(x: 0, y: 0, width: Width(), height: 60))
        tempView.backgroundColor = UIColor.cyan.alpha(0.2)
        tempView.alpha           = 0
        self.addSubview(tempView)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            
            tempView.alpha = 0.8
            
        }) { (finished) in
            
            UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseOut, animations: {
                
                tempView.alpha = 0
                
                }, completion: { (finished) in
                    
                    tempView.removeFromSuperview()
            })
        }
    }
}
