//
//  SuggestionTableViewCell.swift
//  Nomster
//
//  Created by Tobias Scholze on 01.03.15.
//  Copyright (c) 2015 Tobias Scholze. All rights reserved.
//

import UIKit

class SuggestionTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func useSuggestion(suggestion: Suggestion) {
        nameLabel.text = suggestion.name
        dateLabel.text = NSDateFormatter.localizedStringFromDate (
                            suggestion.date, dateStyle: NSDateFormatterStyle.ShortStyle,
                            timeStyle: NSDateFormatterStyle.ShortStyle
                        )
    }
}