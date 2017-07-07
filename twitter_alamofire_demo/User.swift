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
    var screenName: String
    var profileImageURL: String!
    
    var dictionary: [String: Any]?
    
    private static var _current: User?
    
    //Create initializer with dictionary
    init(dictionary: [String: Any]) {
        
        name = dictionary["name"] as! String
        
        screenName = dictionary["screen_name"] as! String
        
        profileImageURL = dictionary["profile_image_url_https"] as! String
        
        self.dictionary = dictionary
        
    }

    static var current: User? {
        get {
            if _current == nil {
                let defaults = UserDefaults.standard
                if let userData = defaults.data(forKey: "currentUserData") {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! [String: Any]
                    _current = User(dictionary: dictionary)
                }
            }
            return _current
        }
        set (user) {
            _current = user
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.removeObject(forKey: "currentUserData")
            }
        }
        
    }
    
    //Using a loop
    //    static func tweets(with array: [[String: Any]]) -> [Tweet] {
    //        var tweets: [Tweet] = []
    //        for tweetDictionary in array {
    //            let tweet = Tweet(dictionary: tweetDictionary)
    //            tweets.append(tweet)
    //        }
    //        return tweets
    //    }
    
    //    //using the flatMap() function of array instances.
    //    static func tweets(with array: [[String: Any]]) -> [Tweet] {
    //        return array.flatMap({ (dictionary) -> Tweet in
    //            Tweet(dictionary: dictionary)
    //        })
    // }
    
    
    //    @IBAction func composeTweet(_ sender: UIBarButtonItem) {
    //        performSegue(withIdentifier: "composeSegue", sender: self)
    //    }
    //
    //    func did(post: Tweet) {
    //        tweets.insert(post, at: 0)
    //        tableView.reloadData()
    //    }
    //
    //    func didTapProfile(_ sender: UITapGestureRecognizer) {
    //        let indexPath = sender.view?.tag
    //        let tweet = tweets[indexPath!]
    //        tappedUser = tweet.user
    //
    //        performSegue(withIdentifier: "profileSegue", sender: nil)
    //
    //    }
    //
    //
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "composeSegue" {
    //            let composeViewController = segue.destination as! ComposeViewController
    //            composeViewController.delegate = self
    //        }
    //        else if segue.identifier == "profileSegue" {
    //            let profileViewController = segue.destination as! ProfileViewController
    //            profileViewController.user = tappedUser
    //        }
    //    }
}
