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
        tableView            = UITableView(frame: (contentView?.bounds)!)
        tableView.dataSource = self
        tableView.delegate   = self
        contentView?.addSubview(tableView!)
        
        // Register cell.
        ListItemCell.registerToTableView(tableView, cellReuseIdentifier: nil)
        
        // Data source.
        adapters = NSMutableArray()
        adapters.addObject(ListItemCell.dataAdapterWithCellHeight(20))
        adapters.addObject(ListItemCell.dataAdapterWithCellHeight(20))
        adapters.addObject(ListItemCell.dataAdapterWithData("String", cellHeight: 0))
    }
    
    // MARK: UITableView's delegate & dataSource.
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return adapters.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let dataAdapter = adapters[indexPath.row] as! CellDataAdapter
        return tableView.dequeueAndLoadContentReusableCellFromAdapter(dataAdapter, indexPath: indexPath)
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
