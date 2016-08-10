//
//  AnimationsListViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/5.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class AnimationsListViewController: CustomNormalContentViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var adapters  : [CellDataAdapter]!
    private var tableView : UITableView!
    
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
        adapters = [CellDataAdapter]()
        adapters.append(ListItemCell.dataAdapterWithData(ControllerItem(controllerClass: TableViewTapAnimationController.classForCoder(), name : "UITableView状态切换效果")))
        adapters.append(ListItemCell.dataAdapterWithData(ControllerItem(controllerClass: HeaderViewTapAnimationController.classForCoder(), name : "UITableView展开缩放动画")))
    }
    
    // MARK: Config TitleView.
    
    override func buildTitleView() {
        
        super.buildTitleView()

        func createBackgroundStringLabel() {

            let string    = "Animations"
            let richText  = NSMutableAttributedString(string: string)
            let length    = string.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
            let allColor  = UIColor(hexString: "#545454")!
            let partColor = UIColor.clearColor()
            richText.addAttributes([NSForegroundColorAttributeName : allColor], range: NSMakeRange(0, length))
            richText.addAttributes([NSForegroundColorAttributeName : partColor], range: NSMakeRange(1, 1))
            richText.addAttributes([NSFontAttributeName : UIFont.AvenirLight(28)], range: NSMakeRange(0, length))
            
            // Title.
            let label            = UILabel()
            label.attributedText = richText
            label.sizeToFit()
            titleView?.addSubview(label)
            label.center = (titleView?.middlePoint)!
        }

        func createForegroundStringLabel() {
            
            let string    = "Animations"
            let richText  = NSMutableAttributedString(string: string)
            let length    = string.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
            let allColor  = UIColor.clearColor()
            let partColor = UIColor(hexString: "#4699D9")!
            richText.addAttributes([NSForegroundColorAttributeName : allColor], range: NSMakeRange(0, length))
            richText.addAttributes([NSForegroundColorAttributeName : partColor], range: NSMakeRange(1, 1))
            richText.addAttributes([NSFontAttributeName : UIFont.AvenirLight(28)], range: NSMakeRange(0, length))
            
            // Title.
            let label            = UILabel()
            label.attributedText = richText
            label.sizeToFit()
            titleView?.addSubview(label)
            label.center = (titleView?.middlePoint)!
            label.startGlowWithGlowRadius(2, glowOpacity: 0.8, glowColor: partColor,
                                          glowDuration: 1, hideDuration: 3, glowAnimationDuration: 2)
        }
        
        createBackgroundStringLabel()
        createForegroundStringLabel()
        
        // Line.
        titleView?.addSubview(UIView.CreateLine(CGRectMake(0, titleView!.height - 0.5, Width(), 0.5), lineColor: UIColor.grayColor().colorWithAlphaComponent(0.2)))
    }
    
    // MARK: UITableView's delegate & dataSource.
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return adapters.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return tableView.dequeueAndLoadContentReusableCellFromAdapter(adapters[indexPath.row], indexPath: indexPath, controller: self)
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

