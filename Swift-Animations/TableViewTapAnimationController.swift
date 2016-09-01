//
//  TableViewTapAnimationController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/7.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class TableViewTapAnimationController: NormalTitleViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegate {
    
    var adapters  : [CellDataAdapter] = [CellDataAdapter]()
    var tableView : UITableView!
    
    override func setup() {
        
        super.setup()
        
        func appendModel(model : TapAnimationModel, cellHeight : CGFloat = 80) {
            
            adapters.append(TableViewTapAnimationCell.Adapter(data: model, cellHeight: cellHeight))
        }
        
        // TableView.
        tableView                = UITableView(frame: (contentView?.bounds)!)
        tableView.dataSource     = self
        tableView.delegate       = self
        tableView.separatorStyle = .None
        contentView?.addSubview(tableView!)
        
        // Register cell.
        TableViewTapAnimationCell.RegisterTo(tableView)
        
        // Data source.
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
        
        let cell      = tableView.dequeueCellAndLoadContentFromAdapter(adapters[indexPath.row], indexPath: indexPath)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.selectedEventWithIndexPath(indexPath)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return adapters[indexPath.row].cellHeight!
    }
    
    // MARK: CustomCellDelegate.
    
    func customCell(cell: CustomCell?, event: AnyObject?) {
        
        print("\(cell) + \(event)")
    }
}


