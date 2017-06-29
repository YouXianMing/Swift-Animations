//
//  LiveImageViewController.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/17.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class LiveImageViewController: NormalTitleViewController {
    
    fileprivate var timer         : Timer!
    fileprivate var count         : NSInteger = 0
    fileprivate var images        : [UIImage] = [UIImage]()
    fileprivate var liveImageView : LiveImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Init images.
        images = [UIImage]()
        images.append(UIImage(named: "pic_1")!)
        images.append(UIImage(named: "pic_2")!)
        images.append(UIImage(named: "pic_3")!)
        images.append(UIImage(named: "pic_4")!)
        
        // Init LiveImageView.
        let image                       = images[0]
        liveImageView                   = LiveImageView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        liveImageView.center            = (contentView?.middlePoint)!
        liveImageView.layer.borderWidth = 3
        liveImageView.layer.borderColor = UIColor.black.cgColor
        liveImageView.duration          = 0.5
        contentView?.addSubview(liveImageView)
        
        let currentIndex = count % images.count
        count            = count + 1
        liveImageView.setImage(images[currentIndex], animated: true)
        
        // Init timer.
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(LiveImageViewController.timerEvent), userInfo: nil, repeats: true)
    }
    
    func timerEvent() {
        
        let currentIndex = count % images.count
        count            = count + 1
        liveImageView.setImage(images[currentIndex], animated: true)
        
        UIView.animate(withDuration: 0.5, animations: {
            
            var tmpRect          = self.liveImageView.bounds
            tmpRect.size         = (self.liveImageView.image?.size)!
            self.liveImageView.bounds = tmpRect
            self.liveImageView.center = (self.contentView?.middlePoint)!
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        timer.invalidate()
    }
}
