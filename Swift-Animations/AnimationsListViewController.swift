//
//  AnimationsListViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/5.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class AnimationsListViewController: CustomNormalContentViewController {

    var tableView : UITableView?
    
    override func setup() {
        
        super.setup()
        
        tableView = UITableView(frame: (contentView?.bounds)!)
        contentView?.addSubview(tableView!)
    }
    
    // MARK: Overwrite system methods.
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        enableInteractivePopGestureRecognizer = false
    }
    
    override func viewDidDisappear(animated: Bool) {
        
        super.viewDidDisappear(animated)
        enableInteractivePopGestureRecognizer = true
    }
}
