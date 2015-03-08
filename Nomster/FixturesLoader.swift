//
//  FixturesLoader.swift
//  Nomster
//
//  Created by Klaus Meyer on 06.03.15.
//  Copyright (c) 2015 Tobias Scholze. All rights reserved.
//

import Foundation

class FixturesLoader {

    func get(ressource: NSString) -> NSArray {
        let path = NSBundle.mainBundle().pathForResource("data", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        return NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSArray
    }

}
