//
//  FontCell.swift
//  Swift-Animations
//
//  Created by YouXianMing on 2017/9/15.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

import UIKit

class FontCell: CustomCell {

    fileprivate var label : UILabel!
    
    override func buildSubview() {
        
        label = UILabel.init(frame: CGRect.zero)
        self.addSubview(label)
    }
    
    override func loadContent() {
        
        let model = data as! FontModel
        
        label.text = model.fontName
        label.font = UIFont.init(name: model.fontName!, size: 16)
        label.sizeToFit()
        
        label.x       = 15
        label.centerY = FontCell.HeightWithData() / 2
    }
    
    override class func HeightWithData(_ data : AnyObject? = nil) -> CGFloat {
        
        return 50
    }
    
    override func selectedEvent() {
        
        delegate?.customCell(self, event: data)
    }
}
