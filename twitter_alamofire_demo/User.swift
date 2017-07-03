//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/17/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    //properties
    var name: String
    var screenName: String?
    static var current: User?
    
    //Create initializer with dictionary
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as! String

    }
}
