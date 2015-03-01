//
//  ListViewController.swift
//  Nomster
//
//  Created by Tobias Scholze on 24.02.15.
//  Copyright (c) 2015 Tobias Scholze. All rights reserved.
//

import UIKit

class ListViewcontroller: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showSuggestion")  {
            let vc = segue.destinationViewController as! DetailViewController
            let index = self.tableView.indexPathForSelectedRow()
            vc.suggestion = appDelegate.suggestions.objectAtIndex(index!.row) as! Suggestion
        }
    }
}

// MARK: - UITableViewDelegate
extension ListViewcontroller: UITableViewDelegate {
    // nothing to override
}

// MARK: - UITableViewDataSource
extension ListViewcontroller: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.suggestions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! SuggestionTableViewCell
        let currentSuggestion: Suggestion = appDelegate.suggestions.objectAtIndex(indexPath.row) as! Suggestion
        
        cell.useSuggestion(currentSuggestion)
        
        return cell
    }
}
