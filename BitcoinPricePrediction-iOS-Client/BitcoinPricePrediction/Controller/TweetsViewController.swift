//
//  TweetsViewController.swift
//  BitcoinPricePrediction
//
//  Created by Sara Babaei on 1/26/21.
//  Copyright © 2021 Sara Babaei. All rights reserved.
//

import Foundation
import UIKit

class TweetsViewController: UIViewController {
    
    @IBOutlet weak var tweetsTableView: UITableView!
    
    var tweetsTableViewDelegate: TweetsTableViewDelegate?
    
    override func viewDidLoad() {
        configure()
    }
    
    func configure() {
        setDelegates()
    }
    
    func setDelegates() {
        guard let tweets = RestAPIManagr.sharedInstance.getTweets() else {
            return
        }
        print(tweets)
        tweetsTableViewDelegate = TweetsTableViewDelegate(tweets: tweets)
        tweetsTableView.delegate = tweetsTableViewDelegate
        tweetsTableView.dataSource = tweetsTableViewDelegate
    }
}
