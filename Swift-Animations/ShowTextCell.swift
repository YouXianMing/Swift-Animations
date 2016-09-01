//
//  ShowTextCell.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/30.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

enum EShowTextCellType : Int {
    
    case NormalType, ExpendType
}

private let heitiSC       : UIFont = UIFont.HeitiSC(16)
private let numberOfLines : Int    = 4

class ShowTextCell: CustomCell {
    
    private var expendLabel : UILabel!
    private var normalLabel : UILabel!
    private var lineView    : UIView!
    private var redView     : UIView!
    
    override func buildSubview() {
        
        normalLabel           = UILabel(frame: CGRectZero)
        normalLabel.font      = heitiSC
        addSubview(normalLabel)
        
        expendLabel           = UILabel(frame: CGRectZero)
        expendLabel.font      = heitiSC
        expendLabel.textColor = UIColor.grayColor().alpha(0.5)
        addSubview(expendLabel)
        
        redView                 = UIView(frame: CGRectMake(0, 20, 2, 14))
        redView.backgroundColor = UIColor.redColor()
        addSubview(redView)
        
        lineView = UIView.CreateLine(CGRectMake(0, 0, Width(), 0.5), lineColor: UIColor.blackColor().alpha(0.1))
        addSubview(lineView)
    }
    
    override func loadContent() {
        
        indexPath?.row == 0 ? (lineView.hidden = true) : (lineView.hidden = false)
        changeStateWithCellType((dataAdapter?.cellType!)!)
    }
    
    private func changeStateWithCellType(type : Int) {
        
        let model = data as! ShowTextModel
        
        normalLabel.sizeToFitWithString(model.inputString!, width: Width() - 30, numberOfLines: numberOfLines)
        normalLabel.left = 15
        normalLabel.top  = 15
        
        expendLabel.sizeToFitWithString(model.inputString!, width: Width() - 30, numberOfLines: 0)
        expendLabel.left = 15
        expendLabel.top  = 15
        
        if type == EShowTextCellType.NormalType.rawValue {
            
            expendLabel.alpha       = 0
            normalLabel.alpha       = 1
            redView.backgroundColor = UIColor.redColor()
            
        } else if type == EShowTextCellType.ExpendType.rawValue {
            
            expendLabel.alpha       = 1
            normalLabel.alpha       = 0
            redView.backgroundColor = UIColor.grayColor()
        }
    }
    
    override func selectedEvent() {
        
        let model = data as! ShowTextModel
        
        if dataAdapter?.cellType == EShowTextCellType.NormalType.rawValue {
            
            self.dataAdapter?.cellType = EShowTextCellType.ExpendType.rawValue
            self.updateWithNewCellHeight(model.expendStringHeight!)
            
            UIView.animateWithDuration(0.25, animations: {
                
                self.normalLabel.alpha       = 0
                self.expendLabel.alpha       = 1
                self.redView.backgroundColor = UIColor.grayColor().alpha(0.5)
            })
            
        } else if dataAdapter?.cellType == EShowTextCellType.ExpendType.rawValue {
            
            self.dataAdapter?.cellType = EShowTextCellType.NormalType.rawValue
            self.updateWithNewCellHeight(model.normalStringHeight!)
            
            UIView.animateWithDuration(0.25, animations: {
                
                self.normalLabel.alpha       = 1
                self.expendLabel.alpha       = 0
                self.redView.backgroundColor = UIColor.redColor()
            })
        }
    }
    
    override class func HeightWithData(data : AnyObject) -> CGFloat {
        
        let model                = data as! ShowTextModel
        model.expendStringHeight = 15 + (model.inputString?.heightWithFont(heitiSC, fixedWidth: Width() - 30))! + 15
        model.normalStringHeight = 15 + String.HeightWithFont(heitiSC) * CGFloat(numberOfLines) + 15
        return model.normalStringHeight!
    }
}

