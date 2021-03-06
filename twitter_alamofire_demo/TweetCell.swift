//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Modified by Malvern Madondo on 7/5/17
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!     //tweet content label
    
    @IBOutlet weak var likesCountLabel: UILabel!    // number of likes
    
    @IBOutlet weak var retweetCountLabel: UILabel!  //number of retweets
    
    @IBOutlet weak var DateLabel: UILabel!          //date posted
    @IBOutlet weak var tweetImageView: UIImageView!
    
    @IBOutlet weak var screenNameLabel: UILabel!    //account name appearing on screen
    
    @IBOutlet weak var userHandleLabel: UILabel!    //aka as username..@handle
    
    //Button Outlets
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var replyButton: UIButton!
    
    
    var tweet: Tweet! {
        didSet {
            tweetImageView.image = nil
            
            tweetImageView.af_setImage(withURL: URL(string: tweet.user.profileImageURL)!)
            
            tweetImageView.clipsToBounds = true
            
            tweetImageView.layer.masksToBounds = true
            
            tweetImageView.layer.borderColor = UIColor.blue.cgColor
            
            tweetImageView.layer.cornerRadius = tweetImageView.frame.height/2
            
            tweetTextLabel.text = tweet.text
            
            screenNameLabel.text = tweet.user.name
            
            userHandleLabel.text = "@\(tweet.user.screenName)" //username
            
            retweetCountLabel.text = String(tweet.retweetCount)
            
            likesCountLabel.text = String(tweet.favoriteCount)
            
            DateLabel.text = tweet.createdAtString
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //------------------------ACTIONS----------------------------
    
    //user likes tweet
    @IBAction func likeButton(_ sender: UIButton) {
        
        let onLikeButtonPress = sender
        //print("You liked " + screenNameLabel.text! + "'s tweet")
        
        if onLikeButtonPress.isSelected == true {
            
            tweet.favorited = false
            onLikeButtonPress.isSelected = false
            
            if tweet.favoriteCount > 0 {
                
                tweet.favoriteCount -= 1 //to avoid negative count
            }
            
            
            likesCountLabel.text = String(tweet.favoriteCount)
            
            APIManager.shared.unfavorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unfavoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    
                    onLikeButtonPress.setImage(UIImage(named: "favor-icon"), for: .normal)
                    print("You unfavorited the following Tweet: \n\(tweet.text)")
                }
                
            }
            
        } else {
            
            tweet.favorited = true
            onLikeButtonPress.isSelected = true
            tweet.favoriteCount += 1
            self.likesCountLabel.text = String(tweet.favoriteCount)
            
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    
                    print("Error favoriting tweet: \(error.localizedDescription)")
                    
                } else if let tweet = tweet {
                    onLikeButtonPress.setImage(UIImage(named: "favor-icon-red"), for: .normal)
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
            
        }
        
        
    } //end button action
    
    
    //user replies tweet
    @IBAction func replyButton(_ sender: UIButton) {
        
        //REPLY action here
    }
    
    //user retweets
    @IBAction func retweetButton(_ sender: UIButton) {
        
        let onRetweetBtnPress = sender
        
        if onRetweetBtnPress.isSelected == true {
            
            tweet.retweeted = false
            onRetweetBtnPress.isSelected = false
            
            if tweet.retweetCount > 0 {
                tweet.retweetCount -= 1
            }
            
            retweetCountLabel.text = String(tweet.retweetCount)
            
            APIManager.shared.unretweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unretweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    onRetweetBtnPress.setImage(UIImage(named: "retweet-icon"), for: .normal)
                    print("You unretweeted the following Tweet: \n\(tweet.text)")
                }
            }
        } else {
            
            tweet.retweeted = true
            onRetweetBtnPress.isSelected = true
            
            tweet.retweetCount += 1
            
            retweetCountLabel.text = String(tweet.retweetCount)
            
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    
                    print("Error retweeting tweet: \(error.localizedDescription)")
                    
                } else if let tweet = tweet {
                    
                    onRetweetBtnPress.setImage(UIImage(named: "retweet-icon-green"), for: .normal)
                    print("Successfully retweeted the following Tweet: \n\(tweet.text)")
                }
            }
        }
        
    } //end button action
    
}
