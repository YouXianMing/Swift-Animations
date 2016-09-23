//
//  MoreInfoView.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/18.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class MoreInfoView: UIView {
    
    var imageView : UIImageView!
    
    override init(frame: CGRect) {
        
        super.init(frame : frame)
        
        layer.borderWidth   = 0.5
        layer.borderColor   = UIColor.black.cgColor
        layer.masksToBounds = true
        
        /*
         *     --------------     *
         *-50->|-view-width-|<-50-*
         *     --------------     *
         */
        let rect              = frame
        imageView             = UIImageView(frame: CGRect(x: -50, y: 0, width: rect.size.width + 50 * 2, height: rect.size.height))
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
