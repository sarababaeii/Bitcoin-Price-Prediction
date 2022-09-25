//
//  FirstViewController.swift
//  BitcoinPricePrediction
//
//  Created by Sara Babaei on 1/25/21.
//  Copyright © 2021 Sara Babaei. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var increaseRate: UILabel!
    @IBOutlet weak var increaseValue: UILabel!
    
    var timer: TimerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setCurrentPrice()
    }
    
    func configure() {
        setCurrentPrice()
        setCurrentDate()
        setTime()
          
//        RestAPIManagr.sharedInstance.sendTweet(tweet: "definitely BTC price will go down.")
    }
    
    func setCurrentDate() {
        dateLabel.text = Date().toWeekDMonth()
    }
    
    func setTime() {
        timeLabel.text = Date().getTimeString()
        timer = TimerDelegate(label: timeLabel)
    }
    
    func setCurrentPrice() {
        let price = RestAPIManagr.sharedInstance.getPrice()
        currentPriceLabel.text = "$\(price)"
    }
}

