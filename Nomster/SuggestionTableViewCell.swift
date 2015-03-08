//
//  SuggestionTableViewCell.swift
//  Nomster
//
//  Created by Tobias Scholze on 01.03.15.
//  Copyright (c) 2015 Tobias Scholze. All rights reserved.
//

import UIKit

class SuggestionTableViewCell: UITableViewCell {
    
    @IBOutlet var logoView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var creatorLabel: UILabel!
    
    func useSuggestion(suggestion: Suggestion) {
        nameLabel.text = suggestion.name
        creatorLabel.text = "Suggested by \(suggestion.creator)"
        dateLabel.text = NSDateFormatter.localizedStringFromDate (
                            suggestion.date, dateStyle: NSDateFormatterStyle.ShortStyle,
                            timeStyle: NSDateFormatterStyle.ShortStyle
                        )
        
        // Setup image view
        logoView.layer.cornerRadius = logoView.frame.width / 2
        logoView.clipsToBounds = true
        logoView.layer.borderWidth = 1.0
        logoView.layer.borderColor = NomsterColors.green().CGColor
        
        // Use image by url or by local path
        if (suggestion.image != "") {
            if (suggestion.image.rangeOfString("http://") != nil || suggestion.image.rangeOfString("https://") != nil) {
                logoView.image = UIImage(data: NSData(contentsOfURL: NSURL(string: suggestion.image)!)!)
            }
            else {
                let path = NSBundle.mainBundle().pathForResource(suggestion.image, ofType: "png")
                logoView.image = UIImage(data: NSData(contentsOfFile: path!)!)
            }
        }
    }
}