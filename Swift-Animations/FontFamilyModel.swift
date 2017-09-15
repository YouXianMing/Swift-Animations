//
//  FontFamilyModel.swift
//  Swift-Animations
//
//  Created by YouXianMing on 2017/9/15.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

import UIKit

class FontFamilyModel: NSObject {

    var familyName : String!
    var fonts      : [FontModel]
    
    private override init() {
    
        self.fonts = []
        super.init()
    }
    
    convenience init(familyName : String) {
        
        self.init()
        self.familyName = familyName
    }
}

class FontModel: NSObject {
    
    var fontName : String?
    
    private override init() {
        
        super.init()
    }
    
    convenience init(fontName : String) {
        
        self.init()
        self.fontName = fontName
    }
}
