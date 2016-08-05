//
//  GCDSemaphore.swift
//  GCD
//
//  http://home.cnblogs.com/u/YouXianMing/
//  https://github.com/YouXianMing
//
//  Created by YouXianMing on 15/10/9.
//

import UIKit

class GCDSemaphore: NSObject {

    // MARK: 变量
    var dispatchSemaphore : dispatch_semaphore_t!
    
    // MARK: 初始化
    override init() {
        
        super.init()
        dispatchSemaphore = dispatch_semaphore_create(0)
    }
    
    init(withValue : Int) {
        
        super.init()
        dispatchSemaphore = dispatch_semaphore_create(withValue)
    }
    
    // 执行
    func signal() -> Bool {
    
        return dispatch_semaphore_signal(dispatchSemaphore) != 0
    }
    
    func wait() {
    
        dispatch_semaphore_wait(dispatchSemaphore, DISPATCH_TIME_FOREVER)
    }
    
    func wait(withNanoseconds : Int64) -> Bool {
    
        return dispatch_semaphore_wait(dispatchSemaphore, dispatch_time(DISPATCH_TIME_NOW, withNanoseconds)) == 0
    }
}
