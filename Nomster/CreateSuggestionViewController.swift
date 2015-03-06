//
//  CreateSuggestionViewController.swift
//  Nomster
//
//  Created by Tobias Scholze on 06.03.15.
//  Copyright (c) 2015 Tobias Scholze. All rights reserved.
//

import UIKit

class CreateSuggestionViewController : UITableViewController {
    
    @IBOutlet var dateField: UITextField!
    var dateFormat: NSDateFormatter = NSDateFormatter()
    var datePicker: UIDatePicker = UIDatePicker()
    
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
    
    // MARK: - Helpers
    
    func updateDateField(sender: UIDatePicker) {
        dateField.text = dateFormat.stringFromDate(sender.date)
    }
}
