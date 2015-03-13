//
//  SecondViewController.swift
//  Nomster
//
//  Created by Tobias Scholze on 24.02.15.
//  Copyright (c) 2015 Tobias Scholze. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Social

class DetailViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var subscribeButton: UIBarButtonItem!
    
    let removeSubscription: String = "Unsubscribe"
    let createSubscription: String = "Subscribe to lunch"
    
    var suggestion: Suggestion = Suggestion()
    var isSubscribed: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        isSubscribed = false
        toggleSubscriptionUi()
        
        // Setup labels
        nameLabel.text = suggestion.name
        descriptionLabel.text = suggestion.description
        
        // Setup map
        let location = CLLocationCoordinate2D(
            latitude: suggestion.latitude,
            longitude: suggestion.longitude
        )
        
        let span = MKCoordinateSpanMake(0.001, 0.001)
        let region = MKCoordinateRegion(
            center: location,
            span: span
        )
        
        let annotation = MKPointAnnotation()
        annotation.setCoordinate(location)
        annotation.title = suggestion.name
        
        mapView.addAnnotation(annotation)
        mapView.setRegion(region, animated: true)
        mapView.mapType = MKMapType.Satellite
        mapView.layer.borderWidth = 2.0
        mapView.layer.borderColor = NomsterColors.green().CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.toolbarHidden = false
        self.tabBarController?.tabBar.hidden = true
    }
    
    // MARK: - Helpers
    
    func toggleSubscriptionUi() {
        if isSubscribed {
            subscribeButton.title = removeSubscription
            subscribeButton.tintColor = UIColor.redColor()
        } else {
            subscribeButton.title = createSubscription
            subscribeButton.tintColor = NomsterColors.green()
        }
    }
    
    // MARK: - Actions
    
    @IBAction func toggleSubscription(sender: AnyObject) {
        isSubscribed = !isSubscribed
        
        if isSubscribed {
            Utils.sheduleLocalNotificationBySuggestion(suggestion)
        } else {
            Utils.unsheduleLocalNotificationByHashValue(suggestion.hashValue)
        }
        
        toggleSubscriptionUi()
    }

    @IBAction func tweetIt(sender: AnyObject) {
        let tweetSheet = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        tweetSheet.setInitialText("Wanna join our lunch? Let's go to \(suggestion.name)!")
        self.presentViewController(tweetSheet, animated: true, completion: nil)
    }
}

