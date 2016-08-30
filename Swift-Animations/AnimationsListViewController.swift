//
//  AnimationsListViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/5.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class AnimationsListViewController: CustomNormalContentViewController, UITableViewDataSource, UITableViewDelegate, DefaultNotificationCenterDelegate {
    
    private var tableView    : UITableView!
    private var notification : DefaultNotificationCenter = DefaultNotificationCenter()
    private var adapters     : [CellDataAdapter]         = [CellDataAdapter]()
    
    override func setup() {
        
        super.setup()
        
        notification.delegate = self
        notification.addNotificationName(NotificationEvent.AnimationsListViewControllerFirstTimeLoadData.Message())
        
        // TableView.
        tableView                = UITableView(frame: (contentView?.bounds)!)
        tableView.dataSource     = self
        tableView.delegate       = self
        tableView.separatorStyle = .None
        tableView.rowHeight      = 50
        contentView?.addSubview(tableView)
        
        // Register cell.
        ListItemCell.RegisterTo(tableView)
    }
    
    // MARK: DefaultNotificationCenterDelegate
    
    func defaultNotificationCenter(notificationName: String, object: AnyObject?) {
        
        func add(controllerClass : AnyClass!, name : String!) {
            
            adapters.append(ListItemCell.Adapter(data: ControllerItem(controllerClass: controllerClass, name: name)))
        }
        
        GCDQueue.executeInMainQueue {
            
            add(TableViewTapAnimationController.classForCoder(),  name: "UITableView状态切换效果")
            add(HeaderViewTapAnimationController.classForCoder(), name: "UITableView展开缩放动画")
            add(CircleAnimationViewController.classForCoder(),    name: "Easing-圆环动画")
            add(LiveImageViewController.classForCoder(),          name: "图片切换效果")
            add(ScrollImageViewController.classForCoder(),        name: "UIScrollView视差效果动画")
            add(CATransform3DM34Controller.classForCoder(),       name: "CATransform3D m34")
            add(TransformFadeViewController.classForCoder(),      name: "图片碎片化mask动画")
            add(MixedColorProgressViewController.classForCoder(), name: "UILabel混色显示")
            add(PageFlipEffectController.classForCoder(),         name: "翻页效果")
            add(TapCellAnimationController.classForCoder(),       name: "Cell点击动画")
            
            var indexPaths = [NSIndexPath]()
            for i in 0 ..< self.adapters.count {
                
                indexPaths.append(NSIndexPath(forRow: i, inSection: 0))
            }
            
            self.tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Fade)
        }
    }
    
    // MARK: Config TitleView.
    
    override func buildTitleView() {
        
        super.buildTitleView()
        
        func createBackgroundStringLabel() {
            
            let string    = "Animations"
            let richText  = NSMutableAttributedString(string: string)
            let length    = string.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
            let allColor  = UIColor.Hex(0x545454)
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
            let partColor = UIColor.Hex(0x4699D9)
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
        
        titleView?.addSubview(BackgroundLineView(frame: titleView!.bounds, lineWidth: 4, lineGap: 4, lineColor: UIColor.blackColor().alpha(0.015), rotate: CGFloat(M_PI_4)))
        createBackgroundStringLabel()
        createForegroundStringLabel()
        
        // Line.
        titleView?.addSubview(UIView.CreateLine(CGRectMake(0, titleView!.height - 0.5, Width(), 0.5), lineColor: UIColor.grayColor().alpha(0.2)))
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

