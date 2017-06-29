//
//  DefaultNotificationCenter.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/19.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

// MARK: protocol DefaultNotificationCenterDelegate

protocol DefaultNotificationCenterDelegate : class {
    
    /**
     DefaultNotificationCenter's event.
     
     - parameter notificationName: Event name.
     - parameter object:           Event object, maybe nil.
     */
    func defaultNotificationCenter(_ notificationName : String, object : AnyObject?)
}

// MARK: protocol DefaultNotificationCenter

class DefaultNotificationCenter: NSObject {

    // MARK: Properties & funcs.
    
    /// DefaultNotificationCenter's delegate.
    weak var delegate : DefaultNotificationCenterDelegate?
    
    /**
     Post message to specified notification name.
     
     - parameter name:   Notification name.
     - parameter object: Data.
     */
    class func PostMessageTo(_ name : String, object : AnyObject? = nil) {
    
        NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: object)
    }
    
    convenience init(delegate: DefaultNotificationCenterDelegate, notificationNames : [String]? = nil) {
        
        self.init()
        self.delegate = delegate
        
        if notificationNames != nil {
            
            for name in notificationNames! {
                
                self.addNotificationName(name)
            }
        }
    }
    
    /**
     Add notification name.
     
     - parameter name: Notification name.
     */
    func addNotificationName(_ name : String) {
        
        var haveTheSameName = false
        
        // Check have the same name or not.
        for model in notificationModels {

            if model.name == name {
                
                haveTheSameName = true
                break
            }
        }
        
        // Add notification.
        if haveTheSameName == false {
            
            let model       = DefaultNotificationCenterModel()
            model.name      = name
            notificationModels.append(model)
            
            NotificationCenter.default.addObserver(self, selector: #selector(DefaultNotificationCenter.notificationEvent), name: NSNotification.Name(rawValue: model.name), object: nil)
        }
    }
    
    /**
     Delete notification name.
     
     - parameter name: Notification name.
     */
    func deleteNotificationName(_ name : String) {

        var haveTheSameName = false
        var index : Int     = 0
        var model : DefaultNotificationCenterModel!
        
        // Check have the same name or not.
        for tmpModel in notificationModels {
            
            if tmpModel.name == name {
                
                haveTheSameName = true
                model           = tmpModel
                break
            }
            
            index = index + 1
        }
        
        // Remove notification.
        if haveTheSameName == true {
            
            NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: model.name), object: nil)
            notificationModels.remove(at: index)
        }
    }
    
    /**
     Remove all notifications.
     */
    func removeAllNotifications() {
        
        for model in notificationModels {
            
            NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: model.name), object: nil)
        }
    }
    
    /**
     Get all the notification names.
     
     - returns: Notification names's array.
     */
    func notificationNames() -> [String] {
        
        var names = [String]()
        
        for model in notificationModels {
            
            names.append(model.name)
        }
        
        return names
    }
    
    /**
     Notification's event.
     
     - parameter obj: The NSNotification object.
     */
    func notificationEvent(_ obj : AnyObject?) {
        
        let notification = obj as! Notification
        delegate?.defaultNotificationCenter(notification.name.rawValue, object: notification.object as AnyObject?)
    }
    
    // MARK: Private properties & func.
    
    /// Store the Notification's infomation.
    fileprivate var notificationModels : [DefaultNotificationCenterModel] = [DefaultNotificationCenterModel]()
    
    deinit {
    
        removeAllNotifications()
    }
}

// MARK: private DefaultNotificationCenterModel

private class DefaultNotificationCenterModel : NSObject {

    var name : String!
}


