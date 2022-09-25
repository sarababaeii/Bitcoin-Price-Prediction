//
//  Tweet.swift
//  BitcoinPricePrediction
//
//  Created by Sara Babaei on 1/26/21.
//  Copyright © 2021 Sara Babaei. All rights reserved.
//

import Foundation

class Tweet {
    var text: String
    var date: Date
    
    init(text: String, date: Date) {
        self.text = text
        self.date = date
    }
}
