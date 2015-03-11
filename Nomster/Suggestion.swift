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
    var creator: String
    var name: String
    var description: String
    var image: String
    var date: NSDate
    var latitude: Double
    var longitude: Double
    
    var hashValue: Int {
        return (31 &* name.hashValue) &+ date.hashValue
    }

    init() {
        self.idSuggestion = 0
        self.creator = "N/A"
        self.name = "N/A"
        self.description = "N/A"
        self.image = ""
        self.date = NSDate.new()
        self.latitude = 0
        self.longitude = 0
    }

    class func initWith(idSuggestion: Int, creator: String, name: String, description: String, image: String, date: NSDate, latitude: Double, longitude: Double) -> Suggestion {
        
        var newSuggestion : Suggestion = Suggestion()
        newSuggestion.idSuggestion = idSuggestion
        newSuggestion.creator = creator
        newSuggestion.name = name
        newSuggestion.description = description
        newSuggestion.image = image
        newSuggestion.date = date
        newSuggestion.latitude = latitude
        newSuggestion.longitude = longitude
        
        return newSuggestion
    }
    
    class func suggestionFromDictionary(dictionary : NSDictionary) -> Suggestion {
        let creatorDict: NSDictionary = dictionary["creator"] as! NSDictionary
        let locationDict: NSDictionary = dictionary["location"] as! NSDictionary

        let id: Int = dictionary["id"] as! Int
        let creator: String = creatorDict["fullname"] as! String
        let name: String = locationDict["name"] as! String
        let description: String = locationDict["description"] as! String
        let image: String = locationDict["image"] as! String
        let date = NSDate(timeIntervalSince1970: dictionary["meet_at"] as! Double)
        let latitude: Double = locationDict["latitude"] as! Double
        let longitude: Double = locationDict["longitude"] as! Double
        
        return Suggestion.initWith(id, creator: creator, name: name, description: description, image:image, date: date, latitude: latitude, longitude: longitude)
    }
}
