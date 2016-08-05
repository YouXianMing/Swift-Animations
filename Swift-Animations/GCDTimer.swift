//
//  GCDTimer.swift
//  GCD
//
//  http://home.cnblogs.com/u/YouXianMing/
//  https://github.com/YouXianMing
//
//  Created by YouXianMing on 15/10/9.
//

import UIKit

class GCDTimer: NSObject {

    // MARK: 变量
    var dispatchSource : dispatch_source_t!
    
    // MARK: 初始化
    override init() {
        
        super.init()
        dispatchSource = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0))
    }
    
    init(inQueue : GCDQueue) {
        
        super.init()
        self.dispatchSource = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, inQueue.dispatchQueue)
    }
    
    // MARK: 执行
    func event(block : dispatch_block_t, timeIntervalWithNanoseconds : UInt64) {
    
        dispatch_source_set_timer(dispatchSource, dispatch_time(DISPATCH_TIME_NOW, 0), timeIntervalWithNanoseconds, 0)
        dispatch_source_set_event_handler(dispatchSource, block)
    }
    
    func event(block : dispatch_block_t, timeIntervalWithNanoseconds : UInt64, delayWithNanoseconds : Int64) {
        
        dispatch_source_set_timer(dispatchSource, dispatch_time(DISPATCH_TIME_NOW, delayWithNanoseconds), timeIntervalWithNanoseconds, 0)
        dispatch_source_set_event_handler(dispatchSource, block)
    }
    
    func event(block : dispatch_block_t, timeIntervalWithSeconds : Double) {
        
        let timeInterval : UInt64 = UInt64(timeIntervalWithSeconds * Double(NSEC_PER_SEC))
        dispatch_source_set_timer(dispatchSource, dispatch_time(DISPATCH_TIME_NOW, 0), timeInterval, 0)
        dispatch_source_set_event_handler(dispatchSource, block)
    }
    
    func event(block : dispatch_block_t, timeIntervalWithSeconds : Double, delayWithSeconds : Double) {
        
        let timeInterval : UInt64 = UInt64(timeIntervalWithSeconds * Double(NSEC_PER_SEC))
        let delaySeconds : Int64  = Int64(delayWithSeconds * Double(NSEC_PER_SEC));
        dispatch_source_set_timer(dispatchSource, dispatch_time(DISPATCH_TIME_NOW, delaySeconds), timeInterval, 0)
        dispatch_source_set_event_handler(dispatchSource, block)
    }
    
    func start() {
    
        dispatch_resume(dispatchSource)
    }
    
    func destroy() {
    
        dispatch_source_cancel(dispatchSource)
    }
}
