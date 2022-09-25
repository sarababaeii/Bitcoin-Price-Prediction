//
//  APIAddress.swift
//  BitcoinPricePrediction
//
//  Created by Sara Babaei on 1/25/21.
//  Copyright © 2021 Sara Babaei. All rights reserved.
//

import Foundation

struct APIAddress {
    private static let twitterServer = "https://api.twitter.com/2/"
    private static let query = "(bitcoin%20OR%20Bitcoin%20OR%20BITCOIN%20OR%20btc%20OR%20Btc%20OR%20BTC)%20-is:retweet%20lang:en"
    private static let tweetFields = "created_at"
    private static let search = APIAddress.twitterServer + "tweets/search/recent?query=\(APIAddress.query)&tweet.fields=\(APIAddress.tweetFields)"
    
    private static let binanceServer = "https://api.binance.com/api/v3/ticker/"
    private static let price = APIAddress.binanceServer + "price?symbol=BTCUSDT"
    
    private static let trendServer = "http://185.235.40.77:6000/"
    
    static let getPrice = URL(string: APIAddress.price)!
    static let sendTweet = URL(string: APIAddress.trendServer)!
    static let getTweets = URL(string: APIAddress.search)!
}
