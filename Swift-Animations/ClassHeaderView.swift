//
//  ClassHeaderView.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/9.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class ClassHeaderView: CustomHeaderFooterView {
    
    fileprivate var normalClassNameLabel : UILabel!
    fileprivate var highClassNameLabel   : UILabel!
    fileprivate var rotateView           : RotateView!
    
    override func setupHeaderFooterView() {
        
        setHeaderFooterViewBackgroundColor(UIColor.white)
    }
    
    override func buildSubview() {
        
        let contentView = UIView.CreateLine(CGRect(x: 0, y: 2, width: Width(), height: 26), lineColor: UIColor.gray.alpha(0.05))
        self.addSubview(contentView)
        contentView.addSubview(UIView.CreateLine(CGRect(x: 0, y: 0, width: Width(), height: 0.5), lineColor: UIColor.gray.alpha(0.25)))
        contentView.addSubview(UIView.CreateLine(CGRect(x: 0, y: 25.5, width: Width(), height: 0.5), lineColor: UIColor.gray.alpha(0.25)))
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: Width(), height: 30))
        button.addTarget(self, action: #selector(ClassHeaderView.buttonEvent), for: .touchUpInside)
        self.addSubview(button)
        
        normalClassNameLabel      = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: 26))
        normalClassNameLabel.font = UIFont.AppleSDGothicNeoThin(12)
        contentView.addSubview(normalClassNameLabel)
        
        highClassNameLabel           = UILabel(frame: normalClassNameLabel.frame)
        highClassNameLabel.font      = normalClassNameLabel.font
        highClassNameLabel.textColor = UIColor.red
        contentView.addSubview(highClassNameLabel)

        rotateView = RotateView(frame: CGRect(x: Width() - 25, y: 5, width: 20, height: 20))
        self.addSubview(rotateView)
        
        let arrowImageView    = UIImageView(frame: CGRect(x: 0, y: 0, width: 20 / 3.0, height: 36 / 3.0))
        arrowImageView.image  = UIImage(named: "arrows_next")
        arrowImageView.center = rotateView.middlePoint
        rotateView.addSubview(arrowImageView)
    }
    
    override func loadContent() {
        
        let model = data as! ClassModel
        
        normalClassNameLabel.text = model.className
        highClassNameLabel.text   = model.className
        
        if model.expend == true {
        
            extendStateAnimated(false)
            
        } else {
        
            normalStateAnimated(false)
        }
    }

    func buttonEvent() {
    
        let model = data as! ClassModel
        
        if model.expend == true {
            
            model.expend = false
            normalStateAnimated(true)
            
            var indexPaths = [IndexPath]()
            let index      = model.students.count
            for i in 0 ..< index {

                indexPaths.append(IndexPath(item: i, section: section!))
            }
            tableView?.deleteRows(at: indexPaths, with: .fade)
            
        } else {
            
            model.expend = true
            extendStateAnimated(true)
            
            var indexPaths = [IndexPath]()
            let index      = model.students.count
            for i in 0 ..< index {
                
                indexPaths.append(IndexPath(item: i, section: section!))
            }
            tableView?.insertRows(at: indexPaths, with: .fade)
        }
    }
    
    func normalStateAnimated(_ animated : Bool) {
        
        UIView.animate(withDuration: animated == true ? 0.5 : 0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .allowUserInteraction, animations: { 
            
            self.normalClassNameLabel.alpha = 1;
            self.normalClassNameLabel.frame = CGRect(x: 10, y: 0, width: 100, height: 26);
            self.highClassNameLabel.alpha   = 0;
            self.highClassNameLabel.frame   = CGRect(x: 10, y: 0, width: 100, height: 26);
            
            }, completion: nil)
        
        rotateView.changeToUpAnimated(animated)
    }
    
    func extendStateAnimated(_ animated : Bool) {
        
        UIView.animate(withDuration: animated == true ? 0.5 : 0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
            
            self.normalClassNameLabel.alpha = 0;
            self.normalClassNameLabel.frame = CGRect(x: 10 + 10, y: 0, width: 100, height: 26);
            self.highClassNameLabel.alpha   = 1;
            self.highClassNameLabel.frame   = CGRect(x: 10 + 10, y: 0, width: 100, height: 26);
            
            }, completion: nil)
        
        rotateView.changeToRightAnimated(animated)
    }
}
