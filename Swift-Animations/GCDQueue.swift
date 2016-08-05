//
//  GCDQueue.swift
//  GCD
//
//  http://home.cnblogs.com/u/YouXianMing/
//  https://github.com/YouXianMing
//
//  Created by YouXianMing on 15/10/9.
//

import UIKit

enum QueueType {
    
    case SerialQueue,     // 串行线程队列
         ConcurrentQueue, // 并发线程队列
         None             // 无类型
}

class GCDQueue: NSObject {
        
    // MARK: 变量
    var dispatchQueue : dispatch_queue_t!
    
    // MARK: 初始化
    override init() {
        
        super.init()
        dispatchQueue = dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT)
    }
    
    init(queueType : QueueType) {
        
        super.init()
        
        switch queueType {
            
        case .SerialQueue:
            
            dispatchQueue = dispatch_queue_create(nil, DISPATCH_QUEUE_SERIAL)
            break
            
        case .ConcurrentQueue:
            
            dispatchQueue = dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT)
            break
            
        case .None:
            
            dispatchQueue = nil
            break
        }
    }
    
    // MARK: 单例
    static let mainQueue : GCDQueue = {
        
        let instance           = GCDQueue(queueType: .None)
        instance.dispatchQueue = dispatch_get_main_queue()
        
        return instance
        }()
    
    static let globalQueue : GCDQueue = {
        
        let instance           = GCDQueue(queueType: .None)
        instance.dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        return instance
        }()
    
    static let highPriorityGlobalQueue : GCDQueue = {
        
        let instance           = GCDQueue(queueType: .None)
        instance.dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
        
        return instance
        }()
    
    static let lowPriorityGlobalQueue : GCDQueue = {
        
        let instance           = GCDQueue(queueType: .None)
        instance.dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
        
        return instance
        }()
    
    static let backgroundPriorityGlobalQueue : GCDQueue = {
        
        let instance           = GCDQueue(queueType: .None)
        instance.dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
        
        return instance
        }()
    
    // MARK: 执行
    
    /**
    Submits a block for asynchronous execution on a dispatch queue and returns immediately.
    
    - parameter block: dispatch block
    */
    func excute(block : dispatch_block_t) {
        
        dispatch_async(dispatchQueue, block)
    }
    
    func excute(block : dispatch_block_t, afterDelayWithNanoseconds : Int64) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, afterDelayWithNanoseconds), dispatchQueue, block)
    }
    
    /**
    Submits a block object for execution on a dispatch queue and waits until that block completes.
    
    - parameter block: dispatch block
    */
    func waitExecute(block : dispatch_block_t) {
        
        dispatch_sync(dispatchQueue, block)
    }
    
    /**
    Submits a barrier block for asynchronous execution and returns immediately.
    
    - parameter block: dispatch block
    */
    func barrierExecute(block : dispatch_block_t) {
        
        dispatch_barrier_async(dispatchQueue, block)
    }
    
    /**
    Submits a barrier block object for execution and waits until that block completes.
    
    - parameter block: dispatch block
    */
    func waitBarrierExecute(block : dispatch_block_t) {
        
        dispatch_barrier_sync(dispatchQueue, block)
    }
    
    // MARK: 便利构造器方法
    class func executeInMainQueue(block : dispatch_block_t) {
    
        dispatch_async(mainQueue.dispatchQueue, block)
    }
    
    class func executeInGlobalQueue(block : dispatch_block_t) {
        
        dispatch_async(globalQueue.dispatchQueue, block)
    }
    
    class func executeInHighPriorityGlobalQueue(block : dispatch_block_t) {
        
        dispatch_async(highPriorityGlobalQueue.dispatchQueue, block)
    }
    
    class func executeInLowPriorityGlobalQueue(block : dispatch_block_t) {
        
        dispatch_async(lowPriorityGlobalQueue.dispatchQueue, block)
    }
    
    class func executeInBackgroundPriorityGlobalQueue(block : dispatch_block_t) {
        
        dispatch_async(backgroundPriorityGlobalQueue.dispatchQueue, block)
    }
    
    class func executeInMainQueue(block : dispatch_block_t, afterDelaySeconds : Double) {
        
        let delayTime : Int64 = Int64(afterDelaySeconds * Double(NSEC_PER_SEC))
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delayTime), mainQueue.dispatchQueue, block)
    }
    
    class func executeInGlobalQueue(block : dispatch_block_t, afterDelaySeconds : Double) {
        
        let delayTime : Int64 = Int64(afterDelaySeconds * Double(NSEC_PER_SEC))
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delayTime), globalQueue.dispatchQueue, block)
    }
    
    class func executeInHighPriorityGlobalQueue(block : dispatch_block_t, afterDelaySeconds : Double) {
        
        let delayTime : Int64 = Int64(afterDelaySeconds * Double(NSEC_PER_SEC))
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delayTime), highPriorityGlobalQueue.dispatchQueue, block)
    }
    
    class func executeInLowPriorityGlobalQueue(block : dispatch_block_t, afterDelaySeconds : Double) {
        
        let delayTime : Int64 = Int64(afterDelaySeconds * Double(NSEC_PER_SEC))
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delayTime), lowPriorityGlobalQueue.dispatchQueue, block)
    }
    
    class func executeInBackgroundPriorityGlobalQueue(block : dispatch_block_t, afterDelaySeconds : Double) {
        
        let delayTime : Int64 = Int64(afterDelaySeconds * Double(NSEC_PER_SEC))
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delayTime), backgroundPriorityGlobalQueue.dispatchQueue, block)
    }
    
    // MARK: 恢复与挂起
    func suspend() {
        
        dispatch_suspend(dispatchQueue)
    }
    
    func resume() {
        
        dispatch_resume(dispatchQueue)
    }
    
    
    // MARK: GCDGroup相关
    func excute(block : dispatch_block_t, inGroup : GCDGroup!) {
        
        dispatch_group_async(inGroup.dispatchGroup, dispatchQueue, block)
    }
    
    func notify(block : dispatch_block_t, inGroup : GCDGroup!) {
        
        dispatch_group_notify(inGroup.dispatchGroup, dispatchQueue, block)
    }
}
