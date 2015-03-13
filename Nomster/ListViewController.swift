//
//  ListViewController.swift
//  Nomster
//
//  Created by Tobias Scholze on 24.02.15.
//  Copyright (c) 2015 Tobias Scholze. All rights reserved.
//

import UIKit

class ListViewcontroller: UITableViewController {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup table view
        refreshControl = UIRefreshControl()
        refreshControl!.attributedTitle = NSAttributedString(string: "Pull to update")
        refreshControl!.addTarget(self, action: "updateListViewDataSource:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.toolbarHidden = true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showSuggestion")  {
            let vc = segue.destinationViewController as! DetailViewController
            let index = tableView.indexPathForSelectedRow()
            vc.suggestion = appDelegate.suggestions.objectAtIndex(index!.row) as! Suggestion
        }
    }
    
    // MARK: - Helper
    
    func updateListViewDataSource(sender:AnyObject) -> Void {
        appDelegate.setSuggestionsByRemoteDataSource()
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
}

// MARK: - UITableViewDelegate
extension ListViewcontroller: UITableViewDelegate {
    // nothing to override
}

// MARK: - UITableViewDataSource
extension ListViewcontroller: UITableViewDataSource {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.suggestions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! SuggestionTableViewCell
        let currentSuggestion: Suggestion = appDelegate.suggestions.objectAtIndex(indexPath.row) as! Suggestion
        
        cell.useSuggestion(currentSuggestion)
        
        return cell
    }
}
