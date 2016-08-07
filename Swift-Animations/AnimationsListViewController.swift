//
//  AnimationsListViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/5.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class AnimationsListViewController: CustomNormalContentViewController, UITableViewDataSource, UITableViewDelegate {
    
    var adapters  : NSMutableArray!
    var tableView : UITableView!
    
    override func setup() {
        
        super.setup()
        
        // TableView.
        tableView                = UITableView(frame: (contentView?.bounds)!)
        tableView.dataSource     = self
        tableView.delegate       = self
        tableView.separatorStyle = .None
        tableView.rowHeight      = 50
        contentView?.addSubview(tableView!)
        
        // Register cell.
        ListItemCell.registerToTableView(tableView, cellReuseIdentifier: nil)
        
        // Data source.
        adapters = NSMutableArray()
        adapters.addObject(ListItemCell.dataAdapterWithData(ControllerItem(controllerClass: TableViewTapAnimationController.classForCoder(), name : "UITableView状态切换效果")))
    }
    
    // MARK: Config TitleView.
    
    override func buildTitleView() {
        
        super.buildTitleView()
        
        // Title.
        let label    = UILabel()
        label.text   = "Animations"
        label.font   = UIFont.AvenirLight(28)
        label.sizeToFit()
        label.center = (titleView?.middlePoint)!
        titleView?.addSubview(label)
        
        // Line.
        titleView?.addSubview(UIView.CreateLine(CGRectMake(0, titleView!.height - 0.5, Width(), 0.5), lineColor: UIColor.grayColor().colorWithAlphaComponent(0.2)))
    }
    
    // MARK: UITableView's delegate & dataSource.
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return adapters.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return tableView.dequeueAndLoadContentReusableCellFromAdapter(adapters[indexPath.row] as! CellDataAdapter, indexPath: indexPath, controller: self)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.selectedEventWithIndexPath(indexPath)
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
