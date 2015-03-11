//
//  NotificationController.swift
//  Nomster WatchKit Extension
//
//  Created by Tobias Scholze on 08.03.15.
//  Copyright (c) 2015 Tobias Scholze. All rights reserved.
//

import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController {

    @IBOutlet var locationLabel: WKInterfaceLabel!
    @IBOutlet var dateLabel: WKInterfaceLabel!
    @IBOutlet var mapView: WKInterfaceMap!
    
    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    /*
    override func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a local notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        completionHandler(.Custom)
    }
    */
    

    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        
        // Setup labels
        let data = remoteNotification["aps"]!["alert"] as! NSDictionary
        let locationName: String = data["locationName"] as! String
        let date: String = data["date"] as! String
        let longitude: Double = data["longitude"] as! Double
        let latitude: Double = data["latitude"] as! Double
        
        locationLabel.setText(locationName)
        dateLabel.setText(date)
       
        // Setup map
        let location = CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
        
        let span = MKCoordinateSpanMake(0.001, 0.001)
        let region = MKCoordinateRegion(
            center: location,
            span: span
        )
        
        mapView.addAnnotation(location, withPinColor: WKInterfaceMapPinColor.Red)
        mapView.setRegion(region)
      
        // Complete the action
        completionHandler(.Custom)
    }

}
