//
//  StoredValueType.swift
//  SwiftDemo
//
//  Created by YouXianMing on 2017/10/9.
//  Copyright © 2017年 TechCode. All rights reserved.
//

import UIKit

final class StoredValueTypeIs<T> {
    
    private init() {}
    
    class var value : StoredValueTypeIs {
        
        get {
            
            return self.init()
        }
    }
    
    subscript(name : String) -> T? {
        
        get {
            
            return UserDefaults.standard.value(forKey: name) as? T
        }
        
        set (newValue) {
            
            UserDefaults.standard.set(newValue, forKey: name)
        }
    }
}
