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
    
    private let backgroundView = LineBackground(length: 0)
    
    private func setupBackgroundView() {
    
        let drawLength        = sqrt(self.bounds.size.width * self.bounds.size.width + self.bounds.size.height * self.bounds.size.height)
        backgroundView.frame  = CGRectMake(0, 0, drawLength, drawLength)
        backgroundView.center = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0)
        backgroundView.setNeedsDisplay()
    }
}

// MARK: Private class : LineBackground

private class LineBackground : UIView {

    private var rotate    : CGFloat = 0
    private var lineWidth : CGFloat = 5
    private var lineGap   : CGFloat = 3
    private var lineColor : UIColor = UIColor.grayColor()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(length : CGFloat) {
        
        self.init(frame : CGRectMake(0, 0, length, length))
    }
    
    override func drawRect(rect: CGRect) {
        
        super.drawRect(rect)
        
        if self.bounds.size.width <= 0 || self.bounds.size.height <= 0 {
            
            return
        }
        
        let context      = UIGraphicsGetCurrentContext()
        let width        = self.bounds.size.width
        let height       = self.bounds.size.width
        let drawLength   = sqrt(width * width + height * height)
        let outerX       = (drawLength - width)  / 2.0
        let outerY       = (drawLength - height) / 2.0
        let tmpLineWidth = lineWidth <= 0 ? 5 : lineWidth
        let tmpLineGap   = lineGap   <= 0 ? 3 : lineGap
        
        var red   : CGFloat = 0
        var green : CGFloat = 0
        var blue  : CGFloat = 0
        var alpha : CGFloat = 0
        
        CGContextTranslateCTM(context, 0.5 * drawLength, 0.5 * drawLength)
        CGContextRotateCTM(context, rotate)
        CGContextTranslateCTM(context, -0.5 * drawLength, -0.5 * drawLength)
        
        lineColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        CGContextSetRGBFillColor(context, red, green, blue, alpha)
        
        var currentX = -outerX
        
        while currentX < drawLength {
            
            CGContextAddRect(context, CGRectMake(currentX, -outerY, tmpLineWidth, drawLength))
            currentX += tmpLineWidth + tmpLineGap
        }
        
        CGContextFillPath(context)
    }
}



