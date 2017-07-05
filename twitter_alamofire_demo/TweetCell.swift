//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit


class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!  //tweet content label
    
    @IBOutlet weak var likesCountLabel: UILabel!  // number of likes
    
    @IBOutlet weak var retweetCount: UILabel! //number of retweets
    
    @IBOutlet weak var DateLabel: UILabel!  //date posted
    @IBOutlet weak var tweetImageView: UIImageView!
  
    @IBOutlet weak var screenNameLabel: UILabel! //account name appearing on screen
    
    @IBOutlet weak var userHandleLabel: UILabel! //aka as username..@handle
    
    //user likes tweet
    @IBAction func likeButton(_ sender: UIButton) {
        print(screenNameLabel.text! + "Liked your tweet!")
    
    }
    
    
    //user replies tweet
    @IBAction func replyButton(_ sender: UIButton) {
    }
    
    //user retweets
    @IBAction func retweetButton(_ sender: UIButton) {
        
        tweet.retweeted = true
        tweet.retweetCount += 1
    }
    
    
    var tweet: Tweet! {
        didSet {
            
            tweetTextLabel.text = tweet.text
            
            screenNameLabel.text = tweet.user.name
            
            //tweetImageView.af_setImage(withURL: tweet.user.imageURL!)
            
            userHandleLabel.text = "@" + (tweet.user.screenName)! //remove !
            retweetCount.text = String(tweet.retweetCount)
            
            likesCountLabel.text = String(tweet.favoriteCount) //remove describing:
            
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
    
}
