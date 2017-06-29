//
//  AnimationsListViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/5.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class AnimationsListViewController: BaseCustomViewController, UITableViewDataSource, UITableViewDelegate, DefaultNotificationCenterDelegate {
    
    fileprivate var tableView    : UITableView!
    fileprivate var notification : DefaultNotificationCenter!
    fileprivate var adapters     : [CellDataAdapter] = [CellDataAdapter]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Add DefaultNotificationCenter.
        notification = DefaultNotificationCenter(delegate: self, notificationNames: [NotificationEvent.animationsListViewControllerFirstTimeLoadData.Message()])

        // TableView.
        tableView                              = UITableView(frame: (contentView?.bounds)!)
        tableView.dataSource                   = self
        tableView.delegate                     = self
        tableView.separatorStyle               = .none
        tableView.rowHeight                    = 50
        tableView.showsVerticalScrollIndicator = false
        contentView?.addSubview(tableView)
        
        // Register cell.
        ListItemCell.RegisterTo(tableView)
    }
    
    // MARK: DefaultNotificationCenterDelegate
    
    func defaultNotificationCenter(_ notificationName: String, object: AnyObject?) {
        
        func add(_ controllerClass : AnyClass!, name : String!) {
            
            adapters.append(ListItemCell.Adapter(data: ControllerItem(controllerClass: controllerClass, name: name)))
        }
        
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
        add(CountDownTimerController.classForCoder(),         name: "UITableView显示倒计时")
        
        var indexPaths = [IndexPath]()
        for i in 0 ..< self.adapters.count {
            
            indexPaths.append(IndexPath(row: i, section: 0))
        }
        
        self.tableView.insertRows(at: indexPaths, with: .fade)
    }
    
    // MARK: Config TitleView.
    
    override func setupSubViews() {
    
        func createBackgroundStringLabel() {
            
            let string    = "Animations"
            let richText  = NSMutableAttributedString(string: string)
            let length    = string.lengthOfBytes(using: String.Encoding.utf8)
            let allColor  = UIColor.Hex(0x545454)
            let partColor = UIColor.clear
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
            let length    = string.lengthOfBytes(using: String.Encoding.utf8)
            let allColor  = UIColor.clear
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
        
        titleView?.addSubview(BackgroundLineView(frame: titleView!.bounds, lineWidth: 4, lineGap: 4, lineColor: UIColor.black.alpha(0.015), rotate: CGFloat(Double.pi / 4)))
        createBackgroundStringLabel()
        createForegroundStringLabel()
        
        // Line.
        titleView?.addSubview(UIView.CreateLine(CGRect(x: 0, y: titleView!.height - 0.5, width: Width(), height: 0.5), lineColor: UIColor.gray.alpha(0.2)))
    }
    
    // MARK: UITableView's delegate & dataSource.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return adapters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return tableView.dequeueCellAndLoadContentFromAdapter(adapters[(indexPath as NSIndexPath).row], indexPath: indexPath, controller: self)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.selectedEventWithIndexPath(indexPath)
    }
    
    // MARK: Overwrite system methods.
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        enableInteractivePopGestureRecognizer = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        enableInteractivePopGestureRecognizer = true
    }
}

