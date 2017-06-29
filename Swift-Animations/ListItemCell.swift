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
    
    fileprivate var titlelabel    : UILabel!
    fileprivate var subTitleLabel : UILabel!
    
    // MARK: Override CustomCell func.
    
    override func setupCell() {
        
        super.setupCell()
        self.accessoryType = .disclosureIndicator
    }
    
    override func buildSubview() {
        
        titlelabel      = UILabel(frame: CGRect(x: 10, y: 8, width: 290, height: 25))
        titlelabel.font = UIFont.HeitiSC(16)
        self.addSubview(titlelabel)
        
        subTitleLabel           = UILabel(frame: CGRect(x: 10, y: 35, width: 290, height: 10))
        subTitleLabel.font      = UIFont.AvenirLight(8)
        subTitleLabel.textColor = UIColor.gray
        self.addSubview(subTitleLabel)
    }
    
    override func loadContent() {
        
        let item           = data as! ControllerItem
        titlelabel.text    = item.name
        subTitleLabel.text = NSStringFromClass(item.controllerClass!).components(separatedBy: ".").last
    }
    
    override func selectedEvent() {
        
        let item         = data as! ControllerItem
        let controller   = (item.controllerClass as! BaseCustomViewController.Type).init()
        controller.title = item.name
        self.controller?.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        
        UIView.animate(withDuration: 0.35, delay: 0, options: .beginFromCurrentState, animations: { 
            
            self.titlelabel.alpha = (highlighted == true ? 0.5    : 1.0)
            self.subTitleLabel.x  = (highlighted == true ? 10 + 4 : 10)
            self.backgroundColor  = (highlighted == true ? UIColor.Hex(0x4699D9).alpha(0.35) : UIColor.clear)
            
        }, completion: nil)
    }
}
