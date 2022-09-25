//
//  JSONSerializer.swift
//  BitcoinPricePrediction
//
//  Created by Sara Babaei on 1/25/21.
//  Copyright © 2021 Sara Babaei. All rights reserved.
//

import Foundation

class JSONSerializer {
    
    //MARK: Decoding
    func decodeData(data: Data) -> NSDictionary? {
        if let result = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
            return result
        }
        print("Could not save new data")
        return nil
    }
    
    //MARK: Encoding
    
    
    
    //MARK: Send Tweet
    func getSendTweetData(tweet: String) -> [String: Any] {
        return [APIKey.tweet.rawValue: tweet]
    }
}
