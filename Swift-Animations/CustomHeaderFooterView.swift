//
//  CustomHeaderFooterView.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/9.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

// MARK: protocol CustomCellDelegate

protocol CustomHeaderFooterViewDelegate : class {
    
    /**
     CustomCell's event.
     
     - parameter cell:  CustomCell type class.
     - parameter event: Event data.
     */
    func customHeaderFooterView(_ headerFooterView: CustomHeaderFooterView?, event: AnyObject?)
}

class CustomHeaderFooterView: UITableViewHeaderFooterView {

    weak var delegate   : CustomHeaderFooterViewDelegate?
    weak var data       : AnyObject?
    weak var tableView  : UITableView?
    weak var controller : UIViewController?
    var section         : Int?
    
    override init(reuseIdentifier: String?) {
        
        super.init(reuseIdentifier: reuseIdentifier)
        setupHeaderFooterView()
        buildSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Setup headerFooterView, override by subclass.
     */
    func setupHeaderFooterView() {}
    
    /**
     Build subview, override by subclass.
     */
    func buildSubview() {}
    
    /**
     Load content, override by subclass.
     */
    func loadContent() {}
    
    /**
     Set HeaderFooterView backgroundColor.
     
     - parameter color: Color.
     */
    func setHeaderFooterViewBackgroundColor(_ color : UIColor) {
    
        self.contentView.backgroundColor = color
    }
    
    /**
     Register headerFooterView to tableView with reuse identifier.
     
     - parameter tableView:           UITableView.
     - parameter cellReuseIdentifier: HeaderFooterView reuse identifier.
     */
    class func RegisterTo(_ tableView: UITableView, reuseIdentifier: String? = nil) {
        
        tableView.register(self.classForCoder(), forHeaderFooterViewReuseIdentifier: (reuseIdentifier != nil) ? reuseIdentifier! : String(describing: self.classForCoder()))
    }
}
