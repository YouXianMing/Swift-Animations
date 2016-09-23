//
//  CellDataAdapter.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/5.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class CellDataAdapter: NSObject {

    // MARK: property
    
    /// Cell's reused identifier.
    var cellReuseIdentifier : String?
    
    /// Data, can be nil.
    var data : AnyObject?
    
    /// Cell's height, only used for UITableView's cell.
    var cellHeight : CGFloat?
    
    /// Cell's type (The same cell, but maybe have different types).
    var cellType : Int?
    
    // MARK: convenience init
    
    convenience init(cellReuseIdentifier: String?, data: AnyObject?, cellHeight: CGFloat?, cellType: Int?) {
        
        self.init()
        self.cellReuseIdentifier = cellReuseIdentifier
        self.data                = data
        self.cellHeight          = cellHeight
        self.cellType            = cellType
    }
    
    // MARK: convenience method
    
    /**
     CellDataAdapter's convenient method, used for UITableView.
     
     - parameter cellReuseIdentifier: Cell's reused identifier.
     - parameter data:                Data, can be nil.
     - parameter cellHeight:          Cell's height.
     - parameter cellType:            Cell's type (The same cell, but maybe have different types).
     
     - returns: CellDataAdapter's object.
     */
    class func CreateTableViewType(_ cellReuseIdentifier: String?, data: AnyObject?, cellHeight: CGFloat?, cellType: Int?) -> CellDataAdapter {
        
        return CellDataAdapter.init(cellReuseIdentifier: cellReuseIdentifier, data: data, cellHeight: cellHeight, cellType: cellType)
    }
    
    /**
     CellDataAdapter's convenient method, used for UICollectionView.
     
     - parameter cellReuseIdentifier: Cell's reused identifier.
     - parameter data:                Data, can be nil.
     - parameter cellType:            Cell's type (The same cell, but maybe have different types).
     
     - returns: CellDataAdapter's object.
     */
    class func CreateCollectionViewType(_ cellReuseIdentifier: String?, data: AnyObject?, cellType: Int?) -> CellDataAdapter {
        
        return CellDataAdapter.init(cellReuseIdentifier: cellReuseIdentifier, data: data, cellHeight: nil, cellType: cellType)
    }
}

