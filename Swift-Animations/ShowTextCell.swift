//
//  ShowTextCell.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/30.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

private let heitiSC : UIFont = UIFont.HeitiSC(16)

class ShowTextCell: CustomCell {
    
    private var contentLabel : UILabel!
    private var lineView     : UIView!
    
    override func buildSubview() {
        
        contentLabel               = UILabel(frame: CGRectZero)
        contentLabel.numberOfLines = 0
        contentLabel.font          = heitiSC
        addSubview(contentLabel)
        
        lineView = UIView.CreateLine(CGRectMake(0, 0, Width(), 0.5), lineColor: UIColor.blackColor().alpha(0.1))
        addSubview(lineView)
    }
    
    override func loadContent() {
        
        let model      = data as! ShowTextModel
        indexPath?.row == 0 ? (lineView.hidden = true) : (lineView.hidden = false)
        contentLabel.sizeToFitWithString(model.inputString!, width: Width() - 30)
        contentLabel.left  = 15
        contentLabel.top   = 15
    }
    
    override class func HeightWithData(data : AnyObject) -> CGFloat {
        
        let model                = data as! ShowTextModel
        model.expendStringHeight = 15 + (model.inputString?.heightWithFont(heitiSC, fixedWidth: Width() - 30))! + 15
        
        return model.expendStringHeight!
    }
}
