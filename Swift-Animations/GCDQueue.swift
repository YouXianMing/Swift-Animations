//
//  GCDQueue.swift
//  Swift-GCD
//
//  Created by YouXianMing on 2017/9/19.
//  Copyright © 2017年 TechCode. All rights reserved.
//

import UIKit

class GCDQueue {
    
    public let dispatchQueue : DispatchQueue
    
    init(dispatchQueue : DispatchQueue) {
        
        self.dispatchQueue = dispatchQueue
    }
    
    // MARK: globalQueue & mainQueue
    
    /// 获取主线程
    public class var Main : GCDQueue {
        
        return GCDQueue.init(dispatchQueue: DispatchQueue.main)
    }
    
    /// 获取子线程
    ///
    /// - Parameter priority: 优先级
    /// - Returns: 子线程
    public class func Global(_ priority : GCDQueuePriority = .DefaultPriority) -> GCDQueue {
        
        return GCDQueue.init(dispatchQueue: DispatchQueue.global(qos: priority.getDispatchQoSClass()))
    }
    
    // MARK: concurrentQueue & serialQueue
    
    /// 获取并发线程
    ///
    /// - Parameters:
    ///   - label: 线程标签
    ///   - priority: 优先级
    /// - Returns: 并发线程
    public class func Concurrent(_ label : String = "", _ priority : GCDQueuePriority = .DefaultPriority) -> GCDQueue {
        
        return GCDQueue.init(dispatchQueue: DispatchQueue(label: label, qos: priority.getDispatchQoS(), attributes: .concurrent))
    }
    
    /// 获取串行线程
    ///
    /// - Parameters:
    ///   - label: 线程标签
    ///   - priority: 优先级
    /// - Returns: 串行线程
    public class func Serial(_ label : String = "", _ priority : GCDQueuePriority = .DefaultPriority) -> GCDQueue {
        
        return GCDQueue.init(dispatchQueue: DispatchQueue(label: label, qos: priority.getDispatchQoS()))
    }
    
    // MARK: Excute
    
    /// 异步执行
    ///
    /// - Parameter excute: 执行的block
    public func excute(_ excute : @escaping ()-> Void) {
        
        dispatchQueue.async(execute: excute)
    }
    
    /// 延时异步执行
    ///
    /// - Parameters:
    ///   - seconds: 延时秒数,最多精确到1ms
    ///   - excute: 执行的block
    public func excuteAfterDelay(_ seconds : Float, _ excute : @escaping ()-> Void) {
        
        dispatchQueue.asyncAfter(deadline: .now() + .milliseconds(Int(seconds * 1000)), execute: excute)
    }
    
    /// 同步执行
    ///
    /// - Parameter excute: 执行的block
    public func excuteAndWaitsUntilTheBlockCompletes(_ excute : @escaping ()-> Void) {
        
        dispatchQueue.sync(execute: excute)
    }
    
    /// 在group中执行
    ///
    /// - Parameters:
    ///   - group: GCDGroup对象
    ///   - excute: 执行的block
    public func excuteInGroup(_ group : GCDGroup, _ excute : @escaping ()-> Void) {
        
        dispatchQueue.async(group: group.dispatchGroup, execute: excute)
    }
    
    // MARK: Class method for excute
    
    /// 在主线程执行
    ///
    /// - Parameter excute: 执行的block
    class func ExcuteInMain(_ excute : @escaping ()-> Void) {
        
        GCDQueue.Main.excute(excute)
    }
    
    /// 在主线程延时执行
    ///
    /// - Parameters:
    ///   - seconds: 延时秒数,最多精确到1ms
    ///   - excute: 执行的block
    class func ExcuteInMainAfterDelay(_ seconds : Float, _ excute : @escaping ()-> Void) {
        
        GCDQueue.Main.excuteAfterDelay(seconds, excute)
    }
    
    /// 在子线程执行
    ///
    /// - Parameters:
    ///   - priority: 优先级
    ///   - excute: 执行的block
    class func ExcuteInGlobal(_ priority : GCDQueuePriority = .DefaultPriority, _ excute : @escaping ()-> Void) {
        
        GCDQueue.Global(priority).excute(excute)
    }
    
    /// 在子线程延时执行
    ///
    /// - Parameters:
    ///   - seconds: 延时秒数,最多精确到1ms
    ///   - excute: 执行的block
    class func ExcuteInGlobalAfterDelay(_ seconds : Float, _ excute : @escaping ()-> Void) {
        
        GCDQueue.Global().excuteAfterDelay(seconds, excute)
    }
}
