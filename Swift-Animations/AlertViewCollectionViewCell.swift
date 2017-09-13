//
//  AlertViewCollectionViewCell.swift
//  Swift-Animations
//
//  Created by YouXianMing on 2017/9/13.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

import UIKit

class AlertViewCollectionViewCell: CustomCollectionViewCell {

    private var rightLineView : UIView!
    private var label         : UILabel!
    
    override func buildSubview() {
        
        self.addSubview(UIView.CreateLine(CGRect.init(x: 0, y: height - 0.5, width: width, height: 0.5), lineColor: UIColor.gray.alpha(0.2)))
        
        rightLineView          = UIView.CreateLine(CGRect.init(x: width - 0.5, y: 0, width: 0.5, height: height), lineColor: UIColor.gray.alpha(0.2))
        rightLineView.isHidden = true
        self.addSubview(rightLineView!)
        
        label               = UILabel.init(frame : self.bounds)
        label.textAlignment = .center
        label.font          = UIFont.HeitiSC(15)
        label.textColor     = UIColor.black
        label.angle         = CGFloat(Double.pi / 4)
        self.addSubview(label)
    }
    
    override func loadContent() {
        
        rightLineView.isHidden = ((indexPath?.row)! % 2 == 0 ? false : true)
        
        label.text = data as? String
    }
    
    override func selectedEvent() {
        
        delegate?.customCollectionViewCell(self, event: data)
    }
    
    override var isHighlighted: Bool {
        
        get { return super.isHighlighted}
        set(newVal) {
            
            super.isHighlighted = newVal
            
            UIView.animate(withDuration: 0.25, delay: 0, options: .beginFromCurrentState, animations: {
                
                self.backgroundColor = (newVal ? UIColor.lightGray.alpha(0.1) : UIColor.white)
                
            }, completion: nil)
        }
    }
}
