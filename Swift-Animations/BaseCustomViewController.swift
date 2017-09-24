//
//  BaseCustomViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 2017/6/29.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

import UIKit

class BaseCustomViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let windowAreaViewId  = "windowAreaViewId"
    let loadingAreaViewId = "loadingAreaViewId"
    let titleViewId       = "titleViewId"
    let contentViewId     = "contentViewId"
    let backgroundViewId  = "backgroundViewId"
    
    var windowAreaView          : ShowLoadingView?
    var loadingAreaView         : ShowLoadingView?
    var titleView               : UIView?
    var contentView             : UIView?
    var backgroundView          : UIView?
    fileprivate var viewsConfig : [String : ControllerBaseViewConfig] = [:]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        initViewsConfigs()
        makeViewsConfig(viewsConfig: viewsConfig)
        buildConfigViews()
        setupSubViews()
    }
    
    ///  Designated initializer.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    ///  Designated initializer.
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    required convenience init(title : String? = nil) {
        
        self.init()
        self.title = title
    }
    
    /// You can use this property when this controller is pushed by an UINavigationController.
    var enableInteractivePopGestureRecognizer : Bool? {
        
        get { return (self.navigationController?.interactivePopGestureRecognizer?.isEnabled)}
        set(newVal) { self.navigationController?.interactivePopGestureRecognizer?.isEnabled = newVal!}
    }
    
    /// You can only use this method when the current controller is an UINavigationController's rootViewController.
    func useInteractivePopGestureRecognizer() {
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    /// If this controller is managed by an UINavigationController, you can use this method to pop.
    ///
    /// - Parameter animated: parameter animated: Animated or not.
    func popViewControllerAnimated(_ animated : Bool) {
        
        self.navigationController?.popViewController(animated: animated)
    }
    
    /// If this controller is managed by an UINavigationController, you can use this method to pop to the rootViewController.
    ///
    /// - Parameter animated: parameter animated: Animated or not.
    func popToRootViewControllerAnimated(_ animated : Bool) {
        
        self.navigationController?.popToRootViewController(animated: animated)
    }
    
    // MARK: -- Private methods --
    
    /// Create the views configs.
    private func initViewsConfigs() {
        
        let width  = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        // backgroundView config.
        do {
            let config                     = ControllerBaseViewConfig()
            config.exist                   = true
            config.frame                   = CGRect(x:0, y:0, width:width, height:height)
            config.backgroundColor         = UIColor.white
            viewsConfig[backgroundViewId]  = config
        }
        
        // contentView config.
        do {
            let config                     = ControllerBaseViewConfig()
            config.exist                   = true
            config.frame                   = CGRect(x:0, y:64, width:width, height:height - 64)
            config.backgroundColor         = UIColor.clear
            viewsConfig[contentViewId]     = config
        }
        
        // titleView config.
        do {
            let config                     = ControllerBaseViewConfig()
            config.exist                   = true
            config.frame                   = CGRect(x:0, y:0, width:width, height:64)
            config.backgroundColor         = UIColor.clear
            viewsConfig[titleViewId]       = config
        }
        
        // loadingAreaView config.
        do {
            let config                     = ControllerBaseViewConfig()
            config.exist                   = true
            config.frame                   = CGRect(x:0, y:64, width:width, height:height - 64)
            config.backgroundColor         = UIColor.clear
            viewsConfig[loadingAreaViewId] = config
        }
        
        // windowAreaView config.
        do {
            let config                     = ControllerBaseViewConfig()
            config.exist                   = true
            config.frame                   = CGRect(x:0, y:0, width:width, height:height)
            config.backgroundColor         = UIColor.clear
            viewsConfig[windowAreaViewId]  = config
        }
    }
    
    /// Use the views configs to create views.
    private func buildConfigViews() {
        
        // backgroundView
        do {
            let config = viewsConfig[backgroundViewId]
            if (config != nil) && (config?.exist)! {
                
                let tmpView             = UIView.init(frame: (config?.frame)!)
                tmpView.backgroundColor = config?.backgroundColor
                self.backgroundView     = tmpView
                self.view .addSubview(tmpView)
            }
        }
        
        // contentView
        do {
            let config = viewsConfig[contentViewId]
            if (config != nil) && (config?.exist)! {
                
                let tmpView             = UIView.init(frame: (config?.frame)!)
                tmpView.backgroundColor = config?.backgroundColor
                self.contentView        = tmpView
                self.view .addSubview(tmpView)
            }
        }
        
        // titleView
        do {
            let config = viewsConfig[titleViewId]
            if (config != nil) && (config?.exist)! {
                
                let tmpView             = UIView.init(frame: (config?.frame)!)
                tmpView.backgroundColor = config?.backgroundColor
                self.titleView          = tmpView
                self.view .addSubview(tmpView)
            }
        }
        
        // loadingAreaView
        do {
            let config = viewsConfig[loadingAreaViewId]
            if (config != nil) && (config?.exist)! {
                
                let tmpView             = ShowLoadingView.init(frame: (config?.frame)!)
                tmpView.backgroundColor = config?.backgroundColor
                self.loadingAreaView    = tmpView
                self.view .addSubview(tmpView)
            }
        }
        
        // windowAreaView
        do {
            let config = viewsConfig[windowAreaViewId]
            if (config != nil) && (config?.exist)! {
                
                let tmpView             = ShowLoadingView.init(frame: (config?.frame)!)
                tmpView.backgroundColor = config?.backgroundColor
                self.windowAreaView     = tmpView
                self.view .addSubview(tmpView)
            }
        }
    }
    
    // MARK: -- Overwrite by subClass --
    
    /// Config the windowAreaView, loadingAreaView, titleView, contentView and the backgroundView.
    ///
    /// - Parameter viewsConfig: Dic that contain the views configs.
    public func makeViewsConfig(viewsConfig : [String : ControllerBaseViewConfig]) {
        
    }
    
    /// Used to setup the subViews.
    public func setupSubViews() {
        
    }
    
    // MARK: -- System method && Debug message --
    
    deinit {
        
        print("[❌] '" + String(describing: self.classForCoder) + "' is released.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        print("[➡️] enter to --> '" + String(describing: self.classForCoder) + "'.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        print("[🕒] leave from <-- '" + String(describing: self.classForCoder) + "'.")
    }
}
