//
//  ListItemCell.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/6.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class ListItemCell: CustomCell {

    // MARK: Private var.
    
    private var titlelabel    : UILabel!
    private var subTitleLabel : UILabel!
    
    // MARK: Override CustomCell func.
    
    override func setupCell() {
        
        super.setupCell()
        self.accessoryType = .DisclosureIndicator
    }
    
    override func buildSubview() {
        
        titlelabel      = UILabel(frame: CGRectMake(10, 8, 290, 25))
        titlelabel.font = UIFont.HeitiSC(16)
        self.addSubview(titlelabel)
        
        subTitleLabel           = UILabel(frame: CGRectMake(10, 35, 290, 10))
        subTitleLabel.font      = UIFont.AvenirLight(8)
        subTitleLabel.textColor = UIColor.grayColor()
        self.addSubview(subTitleLabel)
    }
    
    override func loadContent() {
        
        let item           = data as! ControllerItem
        titlelabel.text    = item.name
        subTitleLabel.text = NSStringFromClass(item.controllerClass!).componentsSeparatedByString(".").last
    }
    
    override func selectedEvent() {
        
        let item         = data as! ControllerItem
        let controller   = (item.controllerClass as! CustomViewController.Type).init()
        controller.title = item.name
        self.controller?.navigationController?.pushViewController(controller, animated: true)
    }
}
