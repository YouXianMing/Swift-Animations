//
//  AnimationsListViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/5.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class AnimationsListViewController: BaseCustomViewController, UITableViewDataSource, UITableViewDelegate, DefaultNotificationCenterDelegate, CustomCellDelegate {
    
    fileprivate var tableView    : UITableView!
    fileprivate var notification : DefaultNotificationCenter!
    fileprivate var adapters     : [CellDataAdapter] = [CellDataAdapter]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Add DefaultNotificationCenter.
        notification = DefaultNotificationCenter(delegate: self, notificationNames: [NotificationEvent.animationsListViewControllerFirstTimeLoadData.notificationName])

        // TableView.
        tableView                              = UITableView(frame: (contentView?.bounds)!)
        tableView.dataSource                   = self
        tableView.delegate                     = self
        tableView.separatorStyle               = .none
        tableView.rowHeight                    = 50
        tableView.showsVerticalScrollIndicator = false
        contentView?.addSubview(tableView)
        
        // if #available(iOS 11.0, *) {
        //
        //     tableView.contentInsetAdjustmentBehavior = .never
        // }
        
        // Register cell.
        ListItemCell.RegisterTo(tableView)
    }
    
    override func makeViewsConfig(viewsConfig: [String : ControllerBaseViewConfig]) {
        
        /// iPhoneX
        if Screen.CurrentScreen == Screen._375x812 {
        
            let titleViewConfig    = viewsConfig[titleViewId]
            titleViewConfig?.frame = CGRect.init(x: 0, y: 0, width: Screen.Width, height: 64 + additionaliPhoneXTopSafeHeight)
            
            let contentViewConfig    = viewsConfig[contentViewId]
            contentViewConfig?.frame = CGRect.init(x: 0, y: 64 + additionaliPhoneXTopSafeHeight, width: Screen.Width, height: Screen.Height - (64 + additionaliPhoneXTopSafeHeight))
        }
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
        add(AlertViewController.classForCoder(),              name: "AlertView的使用")
        add(SystemFontInfoController.classForCoder(),         name: "系统字体列表")
        
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
            richText.addAttributes([NSAttributedString.Key.foregroundColor : allColor], range: NSMakeRange(0, length))
            richText.addAttributes([NSAttributedString.Key.foregroundColor : partColor], range: NSMakeRange(1, 1))
            richText.addAttributes([NSAttributedString.Key.font : UIFont.AvenirLight(28) as Any], range: NSMakeRange(0, length))
            
            // Title.
            let label            = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: Screen.Width, height: 64))
            label.attributedText = richText
            label.textAlignment  = .center
            label.bottom         = (titleView?.height)!
            titleView?.addSubview(label)
        }
        
        func createForegroundStringLabel() {
            
            let string    = "Animations"
            let richText  = NSMutableAttributedString(string: string)
            let length    = string.lengthOfBytes(using: String.Encoding.utf8)
            let allColor  = UIColor.clear
            let partColor = UIColor.Hex(0x4699D9)
            richText.addAttributes([NSAttributedString.Key.foregroundColor : allColor], range: NSMakeRange(0, length))
            richText.addAttributes([NSAttributedString.Key.foregroundColor : partColor], range: NSMakeRange(1, 1))
            richText.addAttributes([NSAttributedString.Key.font : UIFont.AvenirLight(28) as Any], range: NSMakeRange(0, length))
            
            // Title.
            let label            = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: Screen.Width, height: 64))
            label.attributedText = richText
            label.textAlignment  = .center
            label.bottom         = (titleView?.height)!
            titleView?.addSubview(label)
            label.startGlowWithGlowRadius(2, glowOpacity: 0.8, glowColor: partColor,
                                          glowDuration: 1, hideDuration: 3, glowAnimationDuration: 2)
        }
        
        titleView?.addSubview(BackgroundLineView(frame: titleView!.bounds, lineWidth: 4, lineGap: 4, lineColor: UIColor.black.alpha(0.015), rotate: CGFloat(Double.pi / 4)))
        createBackgroundStringLabel()
        createForegroundStringLabel()
        
        // Line.
        titleView?.addSubview(UIView.CreateLine(CGRect(x: 0, y: titleView!.height - 0.5, width: Screen.Width, height: 0.5), lineColor: UIColor.gray.alpha(0.2)))
    }
    
    // MARK: UITableView's delegate & dataSource.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return adapters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return tableView.dequeueCellAndLoadContentFromAdapter(adapters[indexPath.row], indexPath: indexPath, delegate : self)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.selectedEventWithIndexPath(indexPath)
    }
    
    // MARK: CustomCell's delegate.
    
    func customCell(_ cell: CustomCell?, event: Any?) {
        
        let item       = event as! ControllerItem
        let metaType   = item.controllerClass.self as! BaseCustomViewController.Type
        let controller = metaType.init(title : item.name)
        navigationController?.pushViewController(controller, animated: true)
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

