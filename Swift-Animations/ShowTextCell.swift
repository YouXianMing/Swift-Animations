//
//  ShowTextCell.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/30.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

enum EShowTextCellType : Int {
    
    case normalType, expendType
}

private let heitiSC       : UIFont = UIFont.HeitiSC(16)
private let numberOfLines : Int    = 4

class ShowTextCell: CustomCell {
    
    fileprivate var expendLabel : UILabel!
    fileprivate var normalLabel : UILabel!
    fileprivate var lineView    : UIView!
    fileprivate var redView     : UIView!
    
    override func buildSubview() {
        
        normalLabel           = UILabel(frame: CGRect.zero)
        normalLabel.font      = heitiSC
        addSubview(normalLabel)
        
        expendLabel           = UILabel(frame: CGRect.zero)
        expendLabel.font      = heitiSC
        expendLabel.textColor = UIColor.gray.alpha(0.5)
        addSubview(expendLabel)
        
        redView                 = UIView(frame: CGRect(x: 0, y: 20, width: 2, height: 14))
        redView.backgroundColor = UIColor.red
        addSubview(redView)
        
        lineView = UIView.CreateLine(CGRect(x: 0, y: 0, width: Width(), height: 0.5), lineColor: UIColor.black.alpha(0.1))
        addSubview(lineView)
    }
    
    override func loadContent() {
        
        (indexPath as NSIndexPath?)?.row == 0 ? (lineView.isHidden = true) : (lineView.isHidden = false)
        changeStateWithCellType((dataAdapter?.cellType!)!)
    }
    
    fileprivate func changeStateWithCellType(_ type : Int) {
        
        let model = data as! ShowTextModel
        
        normalLabel.sizeToFitWithString(model.inputString!, width: Width() - 30, numberOfLines: numberOfLines)
        normalLabel.left = 15
        normalLabel.top  = 15
        
        expendLabel.sizeToFitWithString(model.inputString!, width: Width() - 30, numberOfLines: 0)
        expendLabel.left = 15
        expendLabel.top  = 15
        
        if type == EShowTextCellType.normalType.rawValue {
            
            expendLabel.alpha       = 0
            normalLabel.alpha       = 1
            redView.backgroundColor = UIColor.gray
            
        } else if type == EShowTextCellType.expendType.rawValue {
            
            expendLabel.alpha       = 1
            normalLabel.alpha       = 0
            redView.backgroundColor = UIColor.red
        }
    }
    
    override func selectedEvent() {
        
        let model = data as! ShowTextModel
        
        if dataAdapter?.cellType == EShowTextCellType.normalType.rawValue {
            
            self.dataAdapter?.cellType = EShowTextCellType.expendType.rawValue
            self.updateWithNewCellHeight(model.expendStringHeight!)
            
            UIView.animate(withDuration: 0.25, animations: {
                
                self.normalLabel.alpha       = 0
                self.expendLabel.alpha       = 1
                self.redView.backgroundColor = UIColor.red
            })
            
        } else if dataAdapter?.cellType == EShowTextCellType.expendType.rawValue {
            
            self.dataAdapter?.cellType = EShowTextCellType.normalType.rawValue
            self.updateWithNewCellHeight(model.normalStringHeight!)
            
            UIView.animate(withDuration: 0.25, animations: {
                
                self.normalLabel.alpha       = 1
                self.expendLabel.alpha       = 0
                self.redView.backgroundColor = UIColor.gray.alpha(0.5)
            })
        }
    }
    
    override class func HeightWithData(_ data : AnyObject) -> CGFloat {
        
        let model                = data as! ShowTextModel
        model.expendStringHeight = 15 + (model.inputString?.heightWithFont(heitiSC, fixedWidth: Width() - 30))! + 15
        model.normalStringHeight = 15 + String.HeightWithFont(heitiSC) * CGFloat(numberOfLines) + 15
        return model.normalStringHeight!
    }
}

