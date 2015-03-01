//
//  Suggestion.swift
//  Nomster - Lunch planning done right
//
//  Created by Tobias Scholze on 24.02.15.
//  Copyright (c) 2015 Tobias Scholze. All rights reserved.
//

import Foundation

class Suggestion {
    
    let idSuggestion: Int
    let name: String
    let description: String
    let date: NSDate
    let latitude: Double
    let longitude: Double
    
    init() {
        self.idSuggestion = 0
        self.name = "N/A"
        self.description = "N/A"
        self.date = NSDate.new()
        self.latitude = 0
        self.longitude = 0
    }
    
    init(idSuggestion: Int, name: String, description: String, date: NSDate, latitude: Double, longitude: Double) {
        self.idSuggestion = idSuggestion
        self.name = name
        self.description = description
        self.date = date
        self.latitude = latitude
        self.longitude = longitude
    }
    
    class func suggestionFromDictionary(dictionary : NSDictionary) -> Suggestion {
        let id: Int = dictionary["idSuggestion"] as! Int
        let name: String = dictionary["name"] as! String
        let description: String = dictionary["description"] as! String
        let date = NSDate(timeIntervalSince1970: dictionary["date"] as! Double)
        let latitude: Double = dictionary["latitude"] as! Double
        let longitude: Double = dictionary["longitude"] as! Double
        
        return Suggestion(idSuggestion: id, name: name, description: description, date: date, latitude: latitude, longitude: longitude)
    }
}
