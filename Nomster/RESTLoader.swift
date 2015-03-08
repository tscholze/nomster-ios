//
//  RESTLoader.swift
//  Nomster
//
//  Created by Klaus Meyer on 06.03.15.
//  Copyright (c) 2015 Tobias Scholze. All rights reserved.
//

import Foundation

class RESTLoader {

    let ApiBase = "http://localhost:3000"

    func get(ressource: NSString) -> NSArray {
        let url: NSURL! = NSURL(string: "\(ApiBase)/\(ressource)")
        let data: NSData? = NSData(contentsOfURL: url)
        var results: NSArray = NSArray()

        if (data != nil) {
            results = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSArray
        }

        return results
    }

}

