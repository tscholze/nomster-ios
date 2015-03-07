//
//  CreateSuggestionViewController.swift
//  Nomster
//
//  Created by Tobias Scholze on 06.03.15.
//  Copyright (c) 2015 Tobias Scholze. All rights reserved.
//

import UIKit

class CreateSuggestionViewController : UITableViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var descriptionField: UITextField!
    @IBOutlet var dateField: UITextField!
    @IBOutlet var latitudeField: UITextField!
    @IBOutlet var longitudeField: UITextField!
    
    let dateFormat: NSDateFormatter = NSDateFormatter()
    let datePicker: UIDatePicker = UIDatePicker()
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup date picker
        dateFormat.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormat.timeStyle = NSDateFormatterStyle.ShortStyle
        datePicker.datePickerMode = UIDatePickerMode.DateAndTime
        datePicker.addTarget(self, action: Selector("updateDateField:"), forControlEvents:UIControlEvents.ValueChanged)
        dateField.inputView = datePicker
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.toolbarHidden = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "saveAndBackToList"  {
            saveSuggestion()
            let vc = segue.destinationViewController as! ListViewcontroller
            NSLog("Length of array \(appDelegate.suggestions.count)")
        }
    }
    
    // MARK: - Helpers
    
    func updateDateField(sender: UIDatePicker) {
        dateField.text = dateFormat.stringFromDate(sender.date)
    }
    
    func saveSuggestion() -> Void {
        var errors: [String] = []
        
        if nameField.text.isEmpty {
            errors.append("Name is missing")
        }
        
        if descriptionField.text.isEmpty {
            errors.append("Description is missing")
        }
        
        if dateField.text.isEmpty {
            errors.append("Date is missing")
        }
        
        if !errors.isEmpty {
            
            // Setup alert view
            let message = ", ".join(errors)
            let alert = UIAlertController(title: "Information missing", message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            return
        }
        
        // Default values
        if latitudeField.text.isEmpty {
            latitudeField.text = String(format: "%f", 48.13761)
        }
        
        if longitudeField.text.isEmpty {
            longitudeField.text = String(format: "%f", 11.579925)
        }
        
        // Dummy values
        let image = "nomster-logo-large"
        
        let latitude = (latitudeField.text as NSString).doubleValue
        let longitude = (longitudeField.text as NSString).doubleValue
        var newSuggestion: Suggestion = Suggestion.initWith(0, name: nameField.text, description: descriptionField.text, image: image, date: datePicker.date, latitude: latitude, longitude: longitude)
        
        appDelegate.suggestions.addObject(newSuggestion)
    }
}
