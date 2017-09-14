//
//  AlertView.swift
//  Swift-Animations
//
//  Created by YouXianMing on 2017/9/14.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

import UIKit

enum AlertViewButtonType : Int {
    
    case Black
    case Red
    case Disable
    
    func SetButtonStyle(button : UIButton) {
        
        button.titleLabel?.font = UIFont.HeitiSC(15)
        
        switch self {
            
        case .Black:
            button.setTitleColor(UIColor.black, for: .normal)
            button.setTitleColor(UIColor.black.alpha(0.5), for: .highlighted)
            break
            
        case .Red:
            button.setTitleColor(UIColor.red, for: .normal)
            button.setTitleColor(UIColor.red.alpha(0.5), for: .highlighted)
            break
            
        case .Disable:
            button.isEnabled = false
            button.setTitleColor(UIColor.gray, for: .disabled)
            break
        }
    }
}

class AlertViewMessageObject: NSObject {
    
    var title   : String?
    var content : String?
    var buttonTitles      : [String]?
    var buttonTitlesState : [AlertViewButtonType]?
    
    private override init() {
        
        super.init()
    }
    
    convenience init(title             : String? = nil,
                     content           : String,
                     buttonTitles      : [String]? = nil,
                     buttonTitlesState : [AlertViewButtonType]? = nil) {
        
        self.init()
        self.title             = title
        self.content           = content
        self.buttonTitles      = buttonTitles
        self.buttonTitlesState = buttonTitlesState
    }
}

class AlertView: BaseMessageView {
    
    fileprivate var blackBackgroundView : UIView!
    fileprivate var whiteView           : UIView!
    fileprivate var titleLabel          : UILabel!
    fileprivate var contentLabel        : UILabel!
    fileprivate var buttonsView         : UIView!
    
    required init(frame : CGRect) {
        
        super.init(frame: CGRect.zero)
    }
    
    required convenience init() {
        
        self.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubViews() {
        
        let message                   = messageObject as! AlertViewMessageObject
        var whiteViewHeight : CGFloat = 0
        
        blackBackgroundView                 = UIView.init(frame: (contentView?.bounds)!)
        blackBackgroundView.backgroundColor = UIColor.black
        blackBackgroundView.alpha           = 0
        self.addSubview(blackBackgroundView)
        
        // 白色背景view
        whiteView                 = UIView.init()
        whiteView.backgroundColor = UIColor.white
        whiteView.width           = Width() / 4 * 3
        self.addSubview(whiteView)
        
        // 标题
        if (message.title != nil) {
            
            titleLabel               = UILabel.init()
            titleLabel.numberOfLines = 0
            titleLabel.font          = UIFont.HeitiSC(16)
            titleLabel.textColor     = UIColor.gray
            titleLabel.text          = message.title
            titleLabel.width         = whiteView.width - 30
            titleLabel.sizeToFit()
            titleLabel.centerX = whiteView.middleX
            titleLabel.top     = 15
            whiteView.addSubview(titleLabel)
        }
        
        // 内容
        contentLabel               = UILabel.init()
        contentLabel.numberOfLines = 0
        contentLabel.font          = UIFont.HeitiSC(14)
        contentLabel.textColor     = UIColor.black.alpha(0.85)
        contentLabel.text          = message.content
        contentLabel.width         = whiteView.width - 30
        contentLabel.sizeToFit()
        contentLabel.centerX = whiteView.middleX
        contentLabel.top     = 15 + (titleLabel != nil ? titleLabel.bottom : 0)
        whiteView.addSubview(contentLabel)
        
        // 如果设置了按钮
        if message.buttonTitles != nil && (message.buttonTitles?.count)! > 0 {
        
            // 按钮的view
            buttonsView = UIView.init(frame: CGRect.init(x: 0, y: contentLabel.bottom + 15, width: whiteView.width, height: 50))
            whiteView.addSubview(self.buttonsView)
            
            // 按钮宽度
            let buttonWidth = whiteView.width / CGFloat((message.buttonTitles?.count)!)
            
            // 添加按钮
            for i in 0 ..< (message.buttonTitles?.count)! {
                
                let button = UIButton.init(frame: CGRect.init(x: CGFloat(i) * buttonWidth, y: 0, width: buttonWidth, height: buttonsView.height))
                button.tag = i + 1000
                button.setTitle(message.buttonTitles?[i], for: .normal)
                button.addTarget(self, action: #selector(AlertView.buttonsEvent), for: .touchUpInside)
                buttonsView.addSubview(button)
                
                // 根据枚举值设置button样式
                message.buttonTitlesState?[i].SetButtonStyle(button: button)
            }
            
            // 添加线条
            buttonsView.addSubview(UIView.CreateLine(CGRect.init(x: 0, y: 0, width: whiteView.width, height: 0.5), lineColor: UIColor.gray.alpha(0.15)))
            for i in 1 ..< (message.buttonTitles?.count)! {
                
                buttonsView.addSubview(UIView.CreateLine(CGRect.init(x: buttonWidth * CGFloat(i), y: 0, width: 0.5, height: 50), lineColor: UIColor.gray.alpha(0.15)))
            }
        }
        
        whiteViewHeight  = contentLabel.bottom + 15 + (buttonsView != nil ? buttonsView.height : 0)
        whiteView.height = whiteViewHeight
        whiteView.center = self.middlePoint
        whiteView.alpha  = 0
        whiteView.scale  = 1.5
    }
    
    override func beginShowAnimation() {
        
        beforeStartShowValueConfig()
        delegate?.baseMessageViewWillAppear(self)
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.35, initialSpringVelocity: 0.9, options: .beginFromCurrentState, animations: {
            
            self.whiteView.scale = 1
            
        }) { (success) in
            
            self.delegate?.baseMessageViewDidAppear(self)
        }
        
        UIView.animate(withDuration: 0.3) {
            
            self.blackBackgroundView.alpha = 0.1
            self.whiteView.alpha           = 1
        }
    }
    
    override func startHideAnimated() {
        
        self.blackBackgroundView.alpha = 0
        whiteView.alpha                = 0
    }
    
    @objc private func buttonsEvent(button : UIButton) {
        
        delegate?.baseMessageView(self, event: button.tag - 1000 as AnyObject)
        hide()
    }
}
