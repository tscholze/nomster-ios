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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.toolbarHidden = false
    }
    
    // MARKS: - Actions
    
    @IBAction func dateFieldTouched(sender: AnyObject) {
        if dateField.inputView == nil {

        }
    }
}
