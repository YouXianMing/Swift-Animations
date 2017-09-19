//
//  CustomCollectionViewCell.swift
//  Swift-Animations
//
//  Created by YouXianMing on 2017/9/13.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

import UIKit

// MARK: extension UITableView

extension UICollectionView {
    
    /**
     Dequeue and load content from adapter.
     
     - parameter adapter:         The CellDataAdapter.
     - parameter indexPath:       The indexPath.
     - parameter collectionView:  The CollectionView.
     - parameter delegate:        The CustomCollectionViewCell's delegate.
     - parameter controller:      The controller.
     
     - returns: The CustomCell instance.
     */
    func dequeueCellAndLoadContentFromAdapter(_ adapter      : CellDataAdapter,
                                              indexPath      : IndexPath,
                                              collectionView : UICollectionView?                 = nil,
                                              delegate       : CustomCollectionViewCellDelegate? = nil,
                                              controller     : UIViewController?                 = nil) -> CustomCollectionViewCell {
        
        let cell            = self.dequeueReusableCell(withReuseIdentifier: adapter.cellReuseIdentifier!, for: indexPath) as! CustomCollectionViewCell
        cell.indexPath      = indexPath
        cell.dataAdapter    = adapter
        cell.data           = adapter.data
        cell.collectionView = collectionView
        cell.delegate       = delegate
        cell.controller     = controller
        cell.loadContent()
        
        return cell
    }
    
    func selectedEventWithIndexPath(_ indexPath : IndexPath) {
        
        let cell = self.cellForItem(at: indexPath) as! CustomCollectionViewCell
        
        // Make sure the cell is kind of CustomCell.
        guard cell.isKind(of: CustomCollectionViewCell.classForCoder()) == true else {
            
            return
        }
        
        cell.selectedEvent()
    }
}

// MARK: protocol CustomCellDelegate

protocol CustomCollectionViewCellDelegate : class {
    
    /**
     CustomCell's event.
     
     - parameter cell:  CustomCollectionViewCell type class.
     - parameter event: Event data.
     */
    func customCollectionViewCell(_ cell: CustomCollectionViewCell?, event: Any?)
}

class CustomCollectionViewCell: UICollectionViewCell {
    
    weak var delegate       : CustomCollectionViewCellDelegate?
    weak var dataAdapter    : CellDataAdapter?
    weak var data           : AnyObject?
    var      indexPath      : IndexPath?
    weak var collectionView : UICollectionView?
    weak var controller     : UIViewController?
    var      display        : Bool?

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupCell()
        buildSubview()
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
    
    /**
     Register cell to tableView with cell reuse identifier.
     
     - parameter collectionView:      UICollectionView.
     - parameter cellReuseIdentifier: Cell reuse identifier.
     */
    class func RegisterTo(_ collectionView: UICollectionView, cellReuseIdentifier: String? = nil) {
        
        collectionView.register(self.classForCoder(), forCellWithReuseIdentifier: (cellReuseIdentifier != nil) ? cellReuseIdentifier! : String(describing: self.classForCoder()))
    }
    
    /**
     Create the CustomCell type data adapter.
     
     - parameter reuseIdentifier: The reuseIdentifier.
     - parameter data:            The data.
     - parameter type:            The cell's type.
     
     - returns: The cellDataAdapter.
     */
    class func Adapter(_ reuseIdentifier: String? = nil, data: AnyObject? = nil, type: Int? = nil) -> CellDataAdapter {
        
        let identifier = (reuseIdentifier == nil ? String(describing: self.classForCoder()) : reuseIdentifier)
        
        return CellDataAdapter.init(cellReuseIdentifier: identifier, data: data, cellHeight: 0, cellType: type)
    }
}
