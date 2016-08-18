//
//  ScrollImageViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/18.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class ScrollImageViewController: FullTitleVisualEffectViewController, UIScrollViewDelegate {

    let viewTag            : Int! = 1000
    var onceLinearEquation : Math!
    var pictures           : [UIImage]!
    var scrollView         : UIScrollView!
    
    override func setup() {
        
        super.setup()
        
        onceLinearEquation = Math(pointA: CGPointMake(0, -50), pointB: CGPointMake(contentView!.width, 270 - 80))
        pictures           = [UIImage]()
        pictures.append(UIImage(named: "1")!)
        pictures.append(UIImage(named: "2")!)
        pictures.append(UIImage(named: "3")!)
        pictures.append(UIImage(named: "4")!)
        pictures.append(UIImage(named: "5")!)
        
        scrollView                                = UIScrollView(frame: (contentView?.bounds)!)
        scrollView.delegate                       = self
        scrollView.pagingEnabled                  = true
        scrollView.backgroundColor                = UIColor.blackColor()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces                        = false
        scrollView.contentSize                    = CGSizeMake(CGFloat(pictures.count) * width, height)
        contentView?.addSubview(scrollView)
        
        for i in 0 ..< pictures.count {
            
            let showView              = MoreInfoView(frame: CGRectMake(CGFloat(i) * width, 0, width, height))
            showView.imageView.image = pictures[i]
            showView.tag             = viewTag + i
            scrollView.addSubview(showView)
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {

        let X = scrollView.contentOffset.x
        
        for i in 0 ..< pictures.count {
            
            let showView = scrollView.viewWithTag(viewTag + i) as! MoreInfoView
            showView.imageView.x = onceLinearEquation.k * (X - CGFloat(i) * width) + onceLinearEquation.b
        }
    }
}


