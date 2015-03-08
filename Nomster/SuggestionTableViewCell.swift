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
        dateLabel.text = NSDateFormatter.localizedStringFromDate (
                            suggestion.date, dateStyle: NSDateFormatterStyle.ShortStyle,
                            timeStyle: NSDateFormatterStyle.ShortStyle
                        )
        creatorLabel.text = "Suggestion by \(suggestion.creator)"
        
        logoView.layer.cornerRadius = logoView.frame.width / 2
        logoView.clipsToBounds = true
        logoView.layer.borderWidth = 1.0
        logoView.layer.borderColor = UIColor (
                                        red: 0x33 / 255,
                                        green: 0x99 / 255,
                                        blue: 0x66 / 255,
                                        alpha: 1.0
                                    ).CGColor
        
        if (suggestion.image != "") {
            let data: NSData!

            if (suggestion.image.rangeOfString("http://") != nil || suggestion.image.rangeOfString("https://") != nil) {
                data = NSData(contentsOfURL: NSURL(string: suggestion.image)!)
            }
            else {
                let path = NSBundle.mainBundle().pathForResource(suggestion.image, ofType: "png")
                data = NSData(contentsOfFile: path!)
            }

            logoView.image = UIImage(data: data)
        }
    }
}