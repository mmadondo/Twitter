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

protocol ComposeViewControllerDelegate {
    func did(post: Tweet)
}

class ComposeViewController: UIViewController {
    
    var user: User!
    var profilePic: UIImage!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var screenNameLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!

    @IBOutlet weak var tweetText: UITextView!
    
    @IBAction func onTapCancel(_ sender: Any) {
        
    }

    @IBAction func onTapPost(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        profileImage.clipsToBounds = true
            
        profileImage.layer.cornerRadius = 15
        
        profileImage.layer.masksToBounds = true
        
        profileImage.image = profilePic
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
