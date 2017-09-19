//
//  FontFamilyHeaderView.swift
//  Swift-Animations
//
//  Created by YouXianMing on 2017/9/15.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

import UIKit

class FontFamilyHeaderView: CustomHeaderFooterView {

    fileprivate var label : UILabel!
    
    override func setupHeaderFooterView() {
        
        setHeaderFooterViewBackgroundColor(UIColor.white)
    }
    
    override func buildSubview() {
        
        self.addSubview(BackgroundLineView(frame     : CGRect.init(x: 0, y: 0, width: Screen.Width, height: FontFamilyHeaderView.HeightWithData()),
                                           lineWidth : 4,
                                           lineGap   : 4,
                                           lineColor : UIColor.black.alpha(0.015),
                                           rotate    : CGFloat(Double.pi / 4)))
        
        self.addSubview(UIView.CreateLine(CGRect.init(x: 0, y: 0, width: Screen.Width, height: 0.5),
                                          lineColor: UIColor.black.alpha(0.05)))
        self.addSubview(UIView.CreateLine(CGRect.init(x: 0, y: FontFamilyHeaderView.HeightWithData() - 0.5, width: Screen.Width, height: 0.5),
                                          lineColor: UIColor.black.alpha(0.05)))
        
        label = UILabel.init(frame: CGRect.zero)
        self.addSubview(label)
        
        let button = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: Screen.Width, height: FontFamilyHeaderView.HeightWithData()))
        button.addTarget(self, action: #selector(FontFamilyHeaderView.buttonEvent), for: .touchUpInside)
        self.addSubview(button)
        
        let redView             = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 2, height: 17))
        redView.backgroundColor = UIColor.red
        redView.centerY         = FontFamilyHeaderView.HeightWithData() / 2
        self.addSubview(redView)
    }

    override func loadContent() {
        
        let model = data as! FontFamilyModel
        
        label.text = model.familyName
        label.font = UIFont.init(name: model.familyName!, size: 16)
        label.sizeToFit()
        
        label.x       = 15
        label.centerY = FontFamilyHeaderView.HeightWithData() / 2
    }
    
    override class func HeightWithData(_ data : AnyObject? = nil) -> CGFloat {
        
        return 50
    }
    
    @objc private func buttonEvent() {
        
        delegate?.customHeaderFooterView(self, event: data)
    }
}
