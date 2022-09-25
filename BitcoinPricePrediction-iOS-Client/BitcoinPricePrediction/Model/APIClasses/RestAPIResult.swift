//
//  RestAPIResult.swift
//  BitcoinPricePrediction
//
//  Created by Sara Babaei on 1/25/21.
//  Copyright © 2021 Sara Babaei. All rights reserved.
//

import Foundation

class RestAPIResult {
    let jsonSerializer = JSONSerializer()
    
    var data: Data?
    var response: HTTPURLResponse?
    
    init(data: Data?, response: HTTPURLResponse?) {
        self.data = data
        self.response = response
    }
    
    //MARK: Price
    func getPrice() -> String {
        guard let data = data, let result = jsonSerializer.decodeData(data: data), let price = result["price"] as? String else {
            return "0"
        }
        print(result)
        return price.substring(toIndex: 8)
    }
    
    //MARK: Prediction
    func getPrediction() -> Bool {
        guard let data = data else {
            return false
        }
        let inc = "[1]".data(using: .utf8)
        return data == inc 
    }
    
    //MARK: Tweets
    func getTweets() -> [Tweet]? {
        guard let data = data, let result = jsonSerializer.decodeData(data: data), let rawTweets = result["data"] as? [[String: Any]] else {
            return nil
        }
        var tweets = [Tweet]()
        for rawTweet in rawTweets {
            if let text = rawTweet["text"] as? String, let dateString = rawTweet["created_at"] as? String, let date = Date.getDate(from: dateString) {
                let tweet = Tweet(text: text, date: date)
                tweets.append(tweet)
            }
        }
        return tweets
    }
}
