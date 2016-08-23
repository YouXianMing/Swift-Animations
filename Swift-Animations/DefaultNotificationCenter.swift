//
//  DefaultNotificationCenter.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/19.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

// MARK: protocol DefaultNotificationCenterDelegate

@objc protocol DefaultNotificationCenterDelegate : class {
    
    /**
     DefaultNotificationCenter's event.
     
     - parameter notificationName: Event name.
     - parameter object:           Event object, maybe nil.
     */
    optional func defaultNotificationCenter(notificationName : String, object : AnyObject?)
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
    class func PostMessageTo(name : String, object : AnyObject?) {
    
        NSNotificationCenter.defaultCenter().postNotificationName(name, object: object)
    }
    
    /**
     Add notification name.
     
     - parameter name: Notification name.
     */
    func addNotificationName(name : String) {
        
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
            
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(DefaultNotificationCenter.notificationEvent),
                                                             name: model.name, object: nil)
        }
    }
    
    /**
     Delete notification name.
     
     - parameter name: Notification name.
     */
    func deleteNotificationName(name : String) {

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
            
            NSNotificationCenter.defaultCenter().removeObserver(self, name: model.name, object: nil)
            notificationModels.removeAtIndex(index)
        }
    }
    
    /**
     Remove all notifications.
     */
    func removeAllNotifications() {
        
        for model in notificationModels {
            
            NSNotificationCenter.defaultCenter().removeObserver(self, name: model.name, object: nil)
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
    
    // MARK: Private properties & func.
    
    /// Store the Notification's infomation.
    private var notificationModels : [DefaultNotificationCenterModel] = [DefaultNotificationCenterModel]()
    
    /**
     Notification's event.
     
     - parameter obj: The NSNotification object.
     */
    @objc private func notificationEvent(obj : AnyObject?) {
        
        let notification = obj as! NSNotification
        delegate?.defaultNotificationCenter?(notification.name, object: notification.object)
    }
    
    deinit {
    
        removeAllNotifications()
    }
}

// MARK: private DefaultNotificationCenterModel

private class DefaultNotificationCenterModel : NSObject {

    var name : String!
}


