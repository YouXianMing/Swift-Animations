//
//  TableViewTapAnimationController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/7.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class TableViewTapAnimationController: NormalTitleViewController, UITableViewDelegate, UITableViewDataSource {

    var adapters  : [CellDataAdapter]!
    var tableView : UITableView!
    
    override func setup() {
        
        super.setup()
        
        func appendModel(model : TapAnimationModel) {
            
            guard (adapters != nil) else {
                
                return;
            }
            
            adapters.append(TableViewTapAnimationCell.dataAdapterWithData(model, cellHeight: 80))
        }
        
        // TableView.
        tableView                = UITableView(frame: (contentView?.bounds)!)
        tableView.dataSource     = self
        tableView.delegate       = self
        tableView.separatorStyle = .None
        contentView?.addSubview(tableView!)
        
        // Register cell.
        TableViewTapAnimationCell.registerToTableView(tableView)
        
        // Data source.
        adapters = [CellDataAdapter]()
        appendModel(TapAnimationModel(name: "YouXianMing",     selected: false))
        appendModel(TapAnimationModel(name: "Animations",      selected: false))
        appendModel(TapAnimationModel(name: "YoCelsius",       selected: false))
        appendModel(TapAnimationModel(name: "iOS-Progrommer",  selected: false))
        appendModel(TapAnimationModel(name: "Design-Patterns", selected: false))
        appendModel(TapAnimationModel(name: "Arabia-Terra",    selected: false))
        appendModel(TapAnimationModel(name: "Swift",           selected: false))
    }
    
    // MARK: UITableView's delegate & dataSource.
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return adapters.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return tableView.dequeueAndLoadContentReusableCellFromAdapter(adapters[indexPath.row], indexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.selectedEventWithIndexPath(indexPath)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return adapters[indexPath.row].cellHeight!
    }
}
