//
//  BackgroundLineView.swift
//  LineBackgroundView
//
//  Created by YouXianMing on 16/8/14.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

// MARK: Public class : BackgroundLineView

class BackgroundLineView: UIView {

    // MARK: Properties.
    
    /// Line width, default is 5.
    var lineWidth : CGFloat {
    
        get {return backgroundView.lineWidth}
        
        set(newVal) {
        
            backgroundView.lineWidth = newVal
            backgroundView.setNeedsDisplay()
        }
    }
    
    /// Line gap, default is 3.
    var lineGap : CGFloat {
        
        get {return backgroundView.lineGap}
        
        set(newVal) {
            
            backgroundView.lineGap = newVal
            backgroundView.setNeedsDisplay()
        }
    }
    
    /// Line color, default is grayColor.
    var lineColor : UIColor {
        
        get {return backgroundView.lineColor}
        
        set(newVal) {
            
            backgroundView.lineColor = newVal
            backgroundView.setNeedsDisplay()
        }
    }
    
    /// Rotate value, default is 0.
    var rotate : CGFloat {
    
        get {return backgroundView.rotate}
        
        set(newVal) {
        
            backgroundView.rotate = newVal
            backgroundView.setNeedsDisplay()
        }
    }
    
    convenience init(frame: CGRect, lineWidth : CGFloat, lineGap : CGFloat, lineColor : UIColor, rotate : CGFloat) {
        
        self.init(frame : frame)
        self.lineWidth = lineWidth
        self.lineGap   = lineGap
        self.lineColor = lineColor
        self.rotate    = rotate
    }
    
    // MARK: Override system method.
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        setupBackgroundView()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.layer.masksToBounds = true
        self.addSubview(backgroundView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private value & func.
    
    fileprivate let backgroundView = LineBackground(length: 0)
    
    fileprivate func setupBackgroundView() {
    
        let drawLength        = sqrt(self.bounds.size.width * self.bounds.size.width + self.bounds.size.height * self.bounds.size.height)
        backgroundView.frame  = CGRect(x: 0, y: 0, width: drawLength, height: drawLength)
        backgroundView.center = CGPoint(x: self.bounds.size.width / 2.0, y: self.bounds.size.height / 2.0)
        backgroundView.setNeedsDisplay()
    }
}

// MARK: Private class : LineBackground

private class LineBackground : UIView {

    fileprivate var rotate    : CGFloat = 0
    fileprivate var lineWidth : CGFloat = 5
    fileprivate var lineGap   : CGFloat = 3
    fileprivate var lineColor : UIColor = UIColor.gray
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(length : CGFloat) {
        
        self.init(frame : CGRect(x: 0, y: 0, width: length, height: length))
    }
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
                
        guard self.bounds.size.width > 0 && self.bounds.size.height > 0 else {
        
            return
        }
        
        let context      = UIGraphicsGetCurrentContext()
        let width        = self.bounds.size.width
        let height       = self.bounds.size.height
        let drawLength   = sqrt(width * width + height * height)
        let outerX       = (drawLength - width)  / 2.0
        let outerY       = (drawLength - height) / 2.0
        let tmpLineWidth = lineWidth <= 0 ? 5 : lineWidth
        let tmpLineGap   = lineGap   <= 0 ? 3 : lineGap
        
        var red   : CGFloat = 0
        var green : CGFloat = 0
        var blue  : CGFloat = 0
        var alpha : CGFloat = 0
        
        context?.translateBy(x: 0.5 * drawLength, y: 0.5 * drawLength)
        context?.rotate(by: rotate)
        context?.translateBy(x: -0.5 * drawLength, y: -0.5 * drawLength)
        
        lineColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        context?.setFillColor(red: red, green: green, blue: blue, alpha: alpha)
        
        var currentX = -outerX
        
        while currentX < drawLength {
            
            context?.addRect(CGRect(x: currentX, y: -outerY, width: tmpLineWidth, height: drawLength))
            currentX += tmpLineWidth + tmpLineGap
        }
        
        context?.fillPath()
    }
}



