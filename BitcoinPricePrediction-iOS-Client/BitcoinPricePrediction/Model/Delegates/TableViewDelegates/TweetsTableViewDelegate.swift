//
//  TweetsTableViewDelegate.swift
//  BitcoinPricePrediction
//
//  Created by Sara Babaei on 1/26/21.
//  Copyright © 2021 Sara Babaei. All rights reserved.
//

import Foundation
import UIKit

class TweetsTableViewDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
   
    var tweets = [Tweet]()
    
    //MARK: Initializer
    init(tweets: [Tweet]) {
        self.tweets = tweets
    }
    
    //MARK: Protocol Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCellID", for: indexPath) as! TweetTableViewCell
        if let tweet = tweetDataSource(indexPath: indexPath) {
            cell.setAttributes(tweet: tweet)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tweetDataSource(indexPath: IndexPath) -> Tweet? {
        if indexPath.row < tweets.count {
            return tweets[indexPath.row]
        }
        return nil
    }
}
