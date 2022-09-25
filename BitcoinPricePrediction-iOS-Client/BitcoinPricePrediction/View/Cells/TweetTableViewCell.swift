//
//  TweetTableViewCell.swift
//  BitcoinPricePrediction
//
//  Created by Sara Babaei on 1/26/21.
//  Copyright © 2021 Sara Babaei. All rights reserved.
//

import Foundation
import UIKit

class TweetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var tweet: Tweet?
    
    func setAttributes(tweet: Tweet) {
        self.tweet = tweet
        tweetTextView.text = tweet.text
        tweetTextView.isEditable = false
        dateLabel.text = tweet.date.toDMHmString()
    }
}

