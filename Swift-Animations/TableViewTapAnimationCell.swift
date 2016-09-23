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
    
    fileprivate var titleLabel : UILabel!
    fileprivate var iconView   : UIImageView!
    fileprivate var lineView   : UIView!
    fileprivate var rectView   : UIView!
    
    // MARK: Override CustomCell func.
    
    override func buildSubview() {
        
        rectView                   = UIView(frame: CGRect(x: Width() - 60, y: 23, width: 35, height: 35))
        rectView.layer.borderWidth = 1
        rectView.layer.borderColor = UIColor.gray.cgColor
        self.addSubview(rectView)
        
        iconView       = UIImageView(frame: CGRect(x: Width() - 62, y: 20, width: 40, height: 40))
        iconView.image = UIImage(named: "plane")
        iconView.alpha = 0
        self.addSubview(iconView)
        
        titleLabel           = UILabel(frame: CGRect(x: 30, y: 10, width: 300, height: 60))
        titleLabel.font      = UIFont.Avenir(20)
        titleLabel.textColor = UIColor.gray
        self.addSubview(titleLabel)
        
        lineView                 = UIView(frame: CGRect(x: 30, y: 70, width: 0, height: 2))
        lineView.alpha           = 0
        lineView.backgroundColor = UIColor.red
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
        
            delegate.customCell(self, event: model.name as AnyObject?)
        }
    }
    
    // MARK: Private func.
    
    fileprivate func changeToState(_ state : TableViewTapAnimationCellState, animated : Bool) {
        
        switch state {
            
        case .kNormalState:
            
            UIView.animate(withDuration: animated == false ? 0 : 0.5, delay: 0, usingSpringWithDamping: 7, initialSpringVelocity: 4, options: UIViewAnimationOptions(), animations: {
                
                if animated == true {
                    
                    self.iconView.transform = CGAffineTransform(a: 0.5, b: 0, c: 0, d: 0.5, tx: 0, ty: 0)
                }
                
                self.iconView.alpha   = 0
                self.lineView.alpha   = 0
                self.lineView.frame   = CGRect(x: 30, y: 70, width: 0, height: 2)
                self.titleLabel.frame = CGRect(x: 30, y: 10, width: 300, height: 60)
                
                self.rectView.layer.borderColor  = UIColor.gray.cgColor
                self.rectView.transform          = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
                self.rectView.layer.cornerRadius = 0
                
                }, completion: nil)
            
        case .kSelectedState:
            
            if animated == true {
                
                self.iconView.transform = CGAffineTransform(a: 2, b: 0, c: 0, d: 2, tx: 0, ty: 0)
            }
            
            UIView.animate(withDuration: animated == false ? 0 : 0.5, delay: 0, usingSpringWithDamping: 7, initialSpringVelocity: 4, options: UIViewAnimationOptions(), animations: {
                
                self.iconView.transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
                self.iconView.alpha     = 1
                self.lineView.alpha     = 1
                self.lineView.frame     = CGRect(x: 30, y: 70, width: 200, height: 2)
                self.titleLabel.frame   = CGRect(x: 30 + 50, y: 10, width: 300, height: 60)
                
                self.rectView.layer.borderColor  = UIColor.red.cgColor
                self.rectView.transform          = CGAffineTransform(a: 0.8, b: 0, c: 0, d: 0.8, tx: 0, ty: 0)
                self.rectView.layer.cornerRadius = 4
                
                }, completion: nil)
        }
    }
    
    fileprivate func showSelectedAnimation() {
        
        let tempView             = UIView(frame: CGRect(x: 0, y: 0, width: Width(), height: 80))
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
