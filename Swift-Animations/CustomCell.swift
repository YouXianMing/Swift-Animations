//
//  CustomCell.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/6.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

// MARK: extension UITableView

extension UITableView {

    func dequeueAndLoadContentReusableCellFromAdapter(adapter : CellDataAdapter, indexPath : NSIndexPath) -> CustomCell {
        
        let cell         = self.dequeueReusableCellWithIdentifier(adapter.cellReuseIdentifier!) as! CustomCell
        cell.indexPath   = indexPath
        cell.dataAdapter = adapter
        cell.data        = adapter.data
        cell.loadContent()
        
        return cell
    }
    
    func dequeueAndLoadContentReusableCellFromAdapter(adapter : CellDataAdapter, indexPath : NSIndexPath, controller : UIViewController) -> CustomCell {
        
        let cell         = self.dequeueReusableCellWithIdentifier(adapter.cellReuseIdentifier!) as! CustomCell
        cell.indexPath   = indexPath
        cell.dataAdapter = adapter
        cell.data        = adapter.data
        cell.controller  = controller
        cell.loadContent()
        
        return cell
    }
    
    func selectedEventWithIndexPath(indexPath : NSIndexPath) {
        
        let cell = self.cellForRowAtIndexPath(indexPath) as! CustomCell
        if cell.isKindOfClass(CustomCell.classForCoder()) {
            
            cell.selectedEvent()
        }
    }
}

// MARK: protocol CustomCellDelegate

protocol CustomCellDelegate : class {
    
    /**
     CustomCell's event.
     
     - parameter cell:  CustomCell type class.
     - parameter event: Event data.
     */
    func customCell(cell: CustomCell?, event : AnyObject?)
}

// MARK: CustomCell

class CustomCell: UITableViewCell {
    
    weak var delegate    : CustomCellDelegate?
    weak var dataAdapter : CellDataAdapter?
    weak var data        : AnyObject?
    weak var indexPath   : NSIndexPath?
    weak var tableView   : UITableView?
    weak var controller  : UIViewController?
    var      display     : Bool?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell()
        self.buildSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Setup cell, override by subclass.
     */
    func setupCell() {}
    
    /**
     Build subview, override by subclass.
     */
    func buildSubview() {}
    
    /**
     Load content, override by subclass.
     */
    func loadContent() {}
    
    /**
     Selected event, you should use this method in 'tableView:didSelectRowAtIndexPath:' to make it effective.
     */
    func selectedEvent() {}
    
    class func dataAdapter(reuseIdentifier : String?, data : AnyObject?, cellHeight : CGFloat, type : Int?) -> CellDataAdapter! {
        
        return CellDataAdapter.init(cellReuseIdentifier: (reuseIdentifier != nil) ? reuseIdentifier : String(self.classForCoder()),
                                    data: data, cellHeight: cellHeight, cellType: type)
    }
    
    class func dataAdapterWithData(data : AnyObject?, cellHeight : CGFloat, type : Int?) -> CellDataAdapter! {
        
        return CellDataAdapter.init(cellReuseIdentifier: String(self.classForCoder()), data: data, cellHeight: cellHeight, cellType: type)
    }
    
    class func dataAdapterWithData(data : AnyObject?, cellHeight : CGFloat) -> CellDataAdapter! {
        
        return CellDataAdapter.init(cellReuseIdentifier: String(self.classForCoder()), data: data, cellHeight: cellHeight, cellType: nil)
    }
    
    class func dataAdapterWithCellHeight(cellHeight : CGFloat) -> CellDataAdapter! {
        
        return CellDataAdapter.init(cellReuseIdentifier: String(self.classForCoder()), data: nil, cellHeight: cellHeight, cellType: nil)
    }
    
    class func dataAdapterWithReuseIdentifier(reuseIdentifier : String?, data : AnyObject?, type : Int?) -> CellDataAdapter! {
        
        return CellDataAdapter.init(cellReuseIdentifier: (reuseIdentifier != nil) ? reuseIdentifier : String(self.classForCoder()),
                                    data: data, cellHeight: nil, cellType: type)
    }

    /**
     Register cell to tableView with cell reuse identifier.
     
     - parameter tableView:           UITableView.
     - parameter cellReuseIdentifier: Cell reuse identifier.
     */
    class func registerToTableView(tableView : UITableView, cellReuseIdentifier : String?) {
        
        tableView.registerClass(self.classForCoder(), forCellReuseIdentifier: (cellReuseIdentifier != nil) ? cellReuseIdentifier! : String(self.classForCoder()))
    }
    
    /**
     Register cell to tableView, the cell reuse identifier is the Cell class string.
     
     - parameter tableView: UITableView.
     */
    class func registerToTableView(tableView : UITableView) {
        
        tableView.registerClass(self.classForCoder(), forCellReuseIdentifier: String(self.classForCoder()))
    }
}
