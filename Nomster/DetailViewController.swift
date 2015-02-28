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

class DetailViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var toggleSubscriptionButton: UIButton!
    
    let removeSubscription: String = "Leave the attendees"
    let createSubscription: String = "Enter the attendees"
    
    var suggestion: Suggestion = Suggestion()
    var isSubscribed: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup labels
        nameLabel.text = suggestion.name
        descriptionLabel.text = suggestion.description
        toggleSubscriptionButton.titleLabel?.text = createSubscription
        
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    @IBAction func toggleSubscription(sender: AnyObject) {
        isSubscribed = !isSubscribed

        if isSubscribed {
            toggleSubscriptionButton.setTitle(removeSubscription, forState: UIControlState.Normal)
        } else {
            toggleSubscriptionButton.setTitle(createSubscription, forState: UIControlState.Normal)
        }
    }
}

