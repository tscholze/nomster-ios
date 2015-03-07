//
//  Suggestion.swift
//  Nomster - Lunch planning done right
//
//  Created by Tobias Scholze on 24.02.15.
//  Copyright (c) 2015 Tobias Scholze. All rights reserved.
//

import Foundation

class Suggestion {
    
    var idSuggestion: Int
    var name: String
    var description: String
    var image: String
    var date: NSDate
    var latitude: Double
    var longitude: Double
    
    init() {
        self.idSuggestion = 0
        self.name = "N/A"
        self.description = "N/A"
        self.image = ""
        self.date = NSDate.new()
        self.latitude = 0
        self.longitude = 0
    }
    
    class func initWith(idSuggestion: Int, name: String, description: String, image: String, date: NSDate, latitude: Double, longitude: Double) -> Suggestion {
        
        var newSuggestion : Suggestion = Suggestion()
        newSuggestion.idSuggestion = idSuggestion
        newSuggestion.name = name
        newSuggestion.description = description
        newSuggestion.image = image
        newSuggestion.date = date
        newSuggestion.latitude = latitude
        newSuggestion.longitude = longitude
        
        return newSuggestion
    }
    
    class func suggestionFromDictionary(dictionary : NSDictionary) -> Suggestion {
        let id: Int = dictionary["idSuggestion"] as! Int
        let name: String = dictionary["name"] as! String
        let description: String = dictionary["description"] as! String
        let image: String = dictionary["image"] as! String
        let date = NSDate(timeIntervalSince1970: dictionary["date"] as! Double)
        let latitude: Double = dictionary["latitude"] as! Double
        let longitude: Double = dictionary["longitude"] as! Double
        
        return Suggestion.initWith(id, name: name, description: description, image:image, date: date, latitude: latitude, longitude: longitude)
    }
}
