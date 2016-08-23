//
//  ClassHeaderView.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/9.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class ClassHeaderView: CustomHeaderFooterView {
    
    private var normalClassNameLabel : UILabel!
    private var highClassNameLabel   : UILabel!
    private var rotateView           : RotateView!
    
    override func setupHeaderFooterView() {
        
        setHeaderFooterViewBackgroundColor(UIColor.whiteColor())
    }
    
    override func buildSubview() {
        
        let contentView = UIView.CreateLine(CGRectMake(0, 2, Width(), 26), lineColor: UIColor.grayColor().alpha(0.05))
        self.addSubview(contentView)
        contentView.addSubview(UIView.CreateLine(CGRectMake(0, 0, Width(), 0.5), lineColor: UIColor.grayColor().alpha(0.25)))
        contentView.addSubview(UIView.CreateLine(CGRectMake(0, 25.5, Width(), 0.5), lineColor: UIColor.grayColor().alpha(0.25)))
        
        let button = UIButton(frame: CGRectMake(0, 0, Width(), 30))
        button.addTarget(self, action: #selector(ClassHeaderView.buttonEvent), forControlEvents: .TouchUpInside)
        self.addSubview(button)
        
        normalClassNameLabel      = UILabel(frame: CGRectMake(10, 0, 100, 26))
        normalClassNameLabel.font = UIFont.AppleSDGothicNeoThin(12)
        contentView.addSubview(normalClassNameLabel)
        
        highClassNameLabel           = UILabel(frame: normalClassNameLabel.frame)
        highClassNameLabel.font      = normalClassNameLabel.font
        highClassNameLabel.textColor = UIColor.redColor()
        contentView.addSubview(highClassNameLabel)

        rotateView = RotateView(frame: CGRectMake(Width() - 25, 5, 20, 20))
        self.addSubview(rotateView)
        
        let arrowImageView    = UIImageView(frame: CGRectMake(0, 0, 20 / 3.0, 36 / 3.0))
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
            
            var indexPaths = [NSIndexPath]()
            let index      = model.students.count
            for i in 0 ..< index {

                indexPaths.append(NSIndexPath(forItem: i, inSection: section!))
            }
            tableView?.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Fade)
            
        } else {
            
            model.expend = true
            extendStateAnimated(true)
            
            var indexPaths = [NSIndexPath]()
            let index      = model.students.count
            for i in 0 ..< index {
                
                indexPaths.append(NSIndexPath(forItem: i, inSection: section!))
            }
            tableView?.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Fade)
        }
    }
    
    func normalStateAnimated(animated : Bool) {
        
        UIView.animateWithDuration(animated == true ? 0.5 : 0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .AllowUserInteraction, animations: { 
            
            self.normalClassNameLabel.alpha = 1;
            self.normalClassNameLabel.frame = CGRectMake(10, 0, 100, 26);
            self.highClassNameLabel.alpha   = 0;
            self.highClassNameLabel.frame   = CGRectMake(10, 0, 100, 26);
            
            }, completion: nil)
        
        rotateView.changeToUpAnimated(animated)
    }
    
    func extendStateAnimated(animated : Bool) {
        
        UIView.animateWithDuration(animated == true ? 0.5 : 0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .AllowUserInteraction, animations: {
            
            self.normalClassNameLabel.alpha = 0;
            self.normalClassNameLabel.frame = CGRectMake(10 + 10, 0, 100, 26);
            self.highClassNameLabel.alpha   = 1;
            self.highClassNameLabel.frame   = CGRectMake(10 + 10, 0, 100, 26);
            
            }, completion: nil)
        
        rotateView.changeToRightAnimated(animated)
    }
}
