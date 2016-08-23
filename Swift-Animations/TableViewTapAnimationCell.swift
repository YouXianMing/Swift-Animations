//
//  TableViewTapAnimationCell.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/7.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

enum TableViewTapAnimationCellState : Int {
    
    case kNormalState, kSelectedState
}

class TableViewTapAnimationCell: CustomCell {
    
    // MARK: Private var.
    
    private var titleLabel : UILabel!
    private var iconView   : UIImageView!
    private var lineView   : UIView!
    private var rectView   : UIView!
    
    // MARK: Override CustomCell func.
    
    override func buildSubview() {
        
        rectView                   = UIView(frame: CGRectMake(Width() - 60, 23, 35, 35))
        rectView.layer.borderWidth = 1
        rectView.layer.borderColor = UIColor.grayColor().CGColor
        self.addSubview(rectView)
        
        iconView       = UIImageView(frame: CGRectMake(Width() - 62, 20, 40, 40))
        iconView.image = UIImage(named: "plane")
        iconView.alpha = 0
        self.addSubview(iconView)
        
        titleLabel           = UILabel(frame: CGRectMake(30, 10, 300, 60))
        titleLabel.font      = UIFont.Avenir(20)
        titleLabel.textColor = UIColor.grayColor()
        self.addSubview(titleLabel)
        
        lineView                 = UIView(frame: CGRectMake(30, 70, 0, 2))
        lineView.alpha           = 0
        lineView.backgroundColor = UIColor.redColor()
        self.addSubview(lineView)
    }
    
    override func loadContent() {
        
        let model       = self.data as! TapAnimationModel
        titleLabel.text = model.name
        
        if model.selected == true {
            
            changeToState(.kSelectedState, animated: false)
            
        } else {
            
            changeToState(.kNormalState, animated: false)
        }
    }
    
    override func selectedEvent() {
        
        showSelectedAnimation()
        
        let model = self.data as! TapAnimationModel
        
        if model.selected == true {
            
            model.selected = false
            changeToState(.kNormalState, animated: true)
            
        } else {
            
            model.selected = true
            changeToState(.kSelectedState, animated: true)
        }

        if let delegate = delegate {
        
            delegate.customCell(self, event: model.name)
        }
    }
    
    // MARK: Private func.
    
    private func changeToState(state : TableViewTapAnimationCellState, animated : Bool) {
        
        switch state {
            
        case .kNormalState:
            
            UIView.animateWithDuration(animated == false ? 0 : 0.5, delay: 0, usingSpringWithDamping: 7, initialSpringVelocity: 4, options: .CurveEaseInOut, animations: {
                
                if animated == true {
                    
                    self.iconView.transform = CGAffineTransformMake(0.5, 0, 0, 0.5, 0, 0)
                }
                
                self.iconView.alpha   = 0
                self.lineView.alpha   = 0
                self.lineView.frame   = CGRectMake(30, 70, 0, 2)
                self.titleLabel.frame = CGRectMake(30, 10, 300, 60)
                
                self.rectView.layer.borderColor  = UIColor.grayColor().CGColor
                self.rectView.transform          = CGAffineTransformMake(1, 0, 0, 1, 0, 0)
                self.rectView.layer.cornerRadius = 0
                
                }, completion: nil)
            
        case .kSelectedState:
            
            if animated == true {
                
                self.iconView.transform = CGAffineTransformMake(2, 0, 0, 2, 0, 0)
            }
            
            UIView.animateWithDuration(animated == false ? 0 : 0.5, delay: 0, usingSpringWithDamping: 7, initialSpringVelocity: 4, options: .CurveEaseInOut, animations: {
                
                self.iconView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0)
                self.iconView.alpha     = 1
                self.lineView.alpha     = 1
                self.lineView.frame     = CGRectMake(30, 70, 200, 2)
                self.titleLabel.frame   = CGRectMake(30 + 50, 10, 300, 60)
                
                self.rectView.layer.borderColor  = UIColor.redColor().CGColor
                self.rectView.transform          = CGAffineTransformMake(0.8, 0, 0, 0.8, 0, 0)
                self.rectView.layer.cornerRadius = 4
                
                }, completion: nil)
        }
    }
    
    private func showSelectedAnimation() {
        
        let tempView             = UIView(frame: CGRectMake(0, 0, Width(), 80))
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
