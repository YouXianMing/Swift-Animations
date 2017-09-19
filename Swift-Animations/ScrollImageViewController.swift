//
//  ScrollImageViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/18.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class ScrollImageViewController: FullTitleVisualEffectViewController, UIScrollViewDelegate {

    fileprivate let viewTag            : Int       = 1000
    fileprivate var pictures           : [UIImage] = [UIImage]()
    fileprivate var scrollView         : UIScrollView!
    fileprivate var onceLinearEquation : Math!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        onceLinearEquation = Math((x : 0,                  imageViewX : -50),
                                  (x : contentView!.width, imageViewX : 270 - 80))
        pictures.append(UIImage(named: "1")!)
        pictures.append(UIImage(named: "2")!)
        pictures.append(UIImage(named: "3")!)
        pictures.append(UIImage(named: "4")!)
        pictures.append(UIImage(named: "5")!)
        
        scrollView                                = UIScrollView(frame: (contentView?.bounds)!)
        scrollView.delegate                       = self
        scrollView.isPagingEnabled                  = true
        scrollView.backgroundColor                = UIColor.black
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces                        = false
        scrollView.contentSize                    = CGSize(width: CGFloat(pictures.count) * Screen.Width, height: Screen.Height)
        contentView?.addSubview(scrollView)
        
        for (i, image) in pictures.enumerated() {
            
            let showView              = MoreInfoView(frame: CGRect(x: CGFloat(i) * Screen.Width, y: 0, width: Screen.Width, height: Screen.Height))
            showView.imageView.image = image
            showView.tag             = viewTag + i
            scrollView.addSubview(showView)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let X = scrollView.contentOffset.x
        
        for i in 0 ..< pictures.count {
            
            let showView = scrollView.viewWithTag(viewTag + i) as! MoreInfoView
            showView.imageView.x = onceLinearEquation.k * (X - CGFloat(i) * Screen.Width) + onceLinearEquation.b
        }
    }
}


