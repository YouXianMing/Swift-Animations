//
//  TableViewTapAnimationController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/7.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class TableViewTapAnimationController: NormalTitleViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegate {
    
    fileprivate var adapters  : [CellDataAdapter] = [CellDataAdapter]()
    fileprivate var tableView : UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        func appendModel(_ model : TapAnimationModel, cellHeight : CGFloat = 80) {
            
            adapters.append(TableViewTapAnimationCell.Adapter(data: model, cellHeight: cellHeight))
        }
        
        // TableView.
        tableView                = UITableView(frame: (contentView?.bounds)!)
        tableView.dataSource     = self
        tableView.delegate       = self
        tableView.separatorStyle = .none
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return adapters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell      = tableView.dequeueCellAndLoadContentFromAdapter(adapters[(indexPath as NSIndexPath).row], indexPath: indexPath)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.selectedEventWithIndexPath(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return adapters[(indexPath as NSIndexPath).row].cellHeight!
    }
    
    // MARK: CustomCellDelegate.
    
    func customCell(_ cell: CustomCell?, event: AnyObject?) {
        
        print("\(String(describing: cell)) + \(String(describing: event))")
    }
}


