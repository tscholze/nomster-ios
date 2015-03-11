//
//  Utils.swift
//  Nomster
//
//  Created by Tobias Scholze on 11.03.15.
//  Copyright (c) 2015 Tobias Scholze. All rights reserved.
//

import UIKit

class Utils {

    
    // Shedules a notification by the related suggestion's data.
    class func sheduleLocalNotificationBySuggestion(suggestion: Suggestion) -> Void {
        let newNotification: UILocalNotification = UILocalNotification()
        newNotification.fireDate = suggestion.date
        newNotification.alertTitle = "Time for lunch!"
        newNotification.alertBody = suggestion.name
        newNotification.soundName = UILocalNotificationDefaultSoundName;
        
        UIApplication.sharedApplication().scheduleLocalNotification(newNotification)
        NSLog("Sheduled local notification for \(suggestion.name)")
    }
    
    // Unshedules / cancels a local notification by its hash value
    class func unsheduleLocalNotificationByHashValue(hashValue: Int) -> Void {
        let application: UIApplication = UIApplication.sharedApplication()
        
        // TODO: Find an answer why the array is always empty
        for notification in application.scheduledLocalNotifications {
            if notification.hashValue == hashValue {
                application.cancelLocalNotification(notification as! UILocalNotification)
                NSLog("Unsheduled local notification for \(notification.alertBody!)")
            }
        }
        
        NSLog("No notificaton with hash value '\(hashValue)' found")
    }
}