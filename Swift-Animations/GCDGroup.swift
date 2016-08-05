//
//  GCDGroup.swift
//  GCD
//
//  http://home.cnblogs.com/u/YouXianMing/
//  https://github.com/YouXianMing
//
//  Created by YouXianMing on 15/10/9.
//

import UIKit

class GCDGroup: NSObject {

    // MARK: 变量
    var dispatchGroup : dispatch_group_t!
    
    // MARK: 初始化
    override init() {
        
        super.init()
        dispatchGroup = dispatch_group_create()
    }
    
    // MARK: 操作
    func enter() {
    
        dispatch_group_enter(dispatchGroup)
    }
    
    func leave() {
    
        dispatch_group_leave(dispatchGroup)
    }
    
    func wait() {
    
        dispatch_group_wait(dispatchGroup, DISPATCH_TIME_FOREVER)
    }
    
    func waitWithNanoseconds(nanoseconds : Int64) -> Bool {
    
        return dispatch_group_wait(dispatchGroup, dispatch_time(DISPATCH_TIME_NOW, nanoseconds)) == 0
    }
}
