//
//  ShowLoadingView.swift
//  Swift-Animations
//
//  Created by YouXianMing on 2017/6/29.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

import UIKit

class ShowLoadingView: UIView {
    
    public private(set) var count: Int = 0 {
        
        didSet {
            if count >= 1 {
                isUserInteractionEnabled = true
            } else {
                isUserInteractionEnabled = false
            }
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.isUserInteractionEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// push 一次导致 count + 1
    public func push() {
        count += 1
    }
    
    /// pop 一次导致 count - 1
    public func pop() {
        count -= 1
    }
}
