//
//  TableViewTapAnimationController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/7.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class TableViewTapAnimationController: NormalTitleViewController, UITableViewDelegate, UITableViewDataSource {

    var adapters  : NSMutableArray!
    var tableView : UITableView!
    
    override func setup() {
        
        super.setup()
        
        // TableView.
        tableView                = UITableView(frame: (contentView?.bounds)!)
        tableView.dataSource     = self
        tableView.delegate       = self
        tableView.separatorStyle = .None
        contentView?.addSubview(tableView!)
        
        // Register cell.
        TableViewTapAnimationCell.registerToTableView(tableView, cellReuseIdentifier: nil)
        
        // Data source.
        adapters = NSMutableArray()
        adapters.addObject(TableViewTapAnimationCell.dataAdapterWithData(TapAnimationModel(name: "YouXianMing", selected: false), cellHeight: 80))
        adapters.addObject(TableViewTapAnimationCell.dataAdapterWithData(TapAnimationModel(name: "Animations", selected: false), cellHeight: 80))
        adapters.addObject(TableViewTapAnimationCell.dataAdapterWithData(TapAnimationModel(name: "YoCelsius", selected: false), cellHeight: 80))
        adapters.addObject(TableViewTapAnimationCell.dataAdapterWithData(TapAnimationModel(name: "iOS-Progrommer", selected: false), cellHeight: 80))
        adapters.addObject(TableViewTapAnimationCell.dataAdapterWithData(TapAnimationModel(name: "Design-Patterns", selected: false), cellHeight: 80))
        adapters.addObject(TableViewTapAnimationCell.dataAdapterWithData(TapAnimationModel(name: "Arabia-Terra", selected: false), cellHeight: 80))
        adapters.addObject(TableViewTapAnimationCell.dataAdapterWithData(TapAnimationModel(name: "Swift", selected: false), cellHeight: 80))
    }
    
    // MARK: UITableView's delegate & dataSource.
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return adapters.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return tableView.dequeueAndLoadContentReusableCellFromAdapter(adapters[indexPath.row] as! CellDataAdapter, indexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.selectedEventWithIndexPath(indexPath)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return (adapters[indexPath.row] as! CellDataAdapter).cellHeight!
    }
}
