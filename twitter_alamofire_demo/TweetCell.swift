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
    
    @IBOutlet weak var DateLabel: UILabel!  //date posted
  
    @IBOutlet weak var screenNameLabel: UILabel! //account name appearing on screen
    
    @IBOutlet weak var userHandleLabel: UILabel! //aka as username..@handle
    
    //user likes tweet
    @IBAction func likeButton(_ sender: UIButton) {
        
    
    }
    
    
    //user replies tweet
    @IBAction func replyButton(_ sender: UIButton) {
    }
    
    //user retweets
    @IBAction func retweetButton(_ sender: UIButton) {
    }
    
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
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
