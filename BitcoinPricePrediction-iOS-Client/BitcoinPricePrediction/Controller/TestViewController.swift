//
//  SecondViewController.swift
//  BitcoinPricePrediction
//
//  Created by Sara Babaei on 1/25/21.
//  Copyright © 2021 Sara Babaei. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        tweetTextView.becomeFirstResponder()
    }
    
    @IBAction func submit(_ sender: Any) {
        guard let tweet = tweetTextView.fetchInput() else {
            return
        }
        setPredict(trend: RestAPIManagr.sharedInstance.sendTweet(tweet: tweet))
    }
    
    func setPredict(trend: Bool) {
        if trend {
            resultLabel.text = "BULLISH"
            resultLabel.textColor = Color.green.componentColor
        } else {
            resultLabel.text = "BEARISH"
            resultLabel.textColor = Color.red.componentColor
        }
    }
}

