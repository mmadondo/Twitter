//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Malvern Madondo on 7/5/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//  placeholder text: https://finnwea.com/blog/adding-placeholders-to-uitextviews-in-swift
//

import UIKit
import AlamofireImage
import RSKPlaceholderTextView

protocol ComposeViewControllerDelegate: class {
    func did(post: Tweet)
}

class ComposeViewController: UIViewController {
    
    weak var delegate: ComposeViewController?
    
    var user: User!
    var profilePic: UIImage!
    var tweet: Tweet!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var screenNameLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var tweetText: UITextView!
    
    @IBAction func onTapCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTapPost(_ sender: Any) {
        APIManager.shared.composeTweet(with: tweetText.text) { (tweet, error) in
            
            //let post = self.tweetText.text
            
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                // self.delegate?.did(post: tweet)
                print(tweet)
                print("Compose Tweet Success!")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        userNameLabel.text = "@" + (User.current?.screenName)!  //tweet.user.screenName
        
        screenNameLabel.text = User.current?.name //tweet.user.name
        
        let user = User.current!
        
        let picURL = URL(string: user.profileImageURL)!
        
        profileImage.af_setImage(withURL: picURL)
        
        profileImage.clipsToBounds = true
        
        profileImage.layer.cornerRadius = 15
        
        profileImage.layer.masksToBounds = true
        
        
        self.tweetText = RSKPlaceholderTextView(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: 100))
        
        self.tweetText.text = "What's happening?"
        
        
        self.view.addSubview(self.tweetText)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
