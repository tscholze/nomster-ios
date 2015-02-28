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
    let latitude: Double
    let longitude: Double
    
    init() {
        self.idSuggestion = 0
        self.name = "N/A"
        self.description = "N/A"
        self.latitude = 0
        self.longitude = 0
    }
    
    init(idSuggestion: Int, name: String, description: String, latitude: Double, longitude: Double) {
        self.idSuggestion = idSuggestion
        self.name = name
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
    }
    
    class func suggestionFromDictionary(dictionary : NSDictionary) -> Suggestion {
        let id: Int = dictionary["idSuggestion"] as! Int
        let name: String = dictionary["name"] as! String
        let description: String = dictionary["description"] as! String
        let latitude: Double = dictionary["latitude"] as! Double
        let longitude: Double = dictionary["longitude"] as! Double
        
        return Suggestion(idSuggestion: id, name: name, description: description, latitude: latitude, longitude: longitude)
    }
}
