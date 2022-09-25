//
//  RestAPIManager.swift
//  BitcoinPricePrediction
//
//  Created by Sara Babaei on 1/25/21.
//  Copyright © 2021 Sara Babaei. All rights reserved.
//

import Foundation
import UIKit

class RestAPIManagr {
    
    static let sharedInstance = RestAPIManagr()
    let jsonSerializer = JSONSerializer()

    //MARK: Sending A Request
    private func sendRequest(request: URLRequest, type: APIRequestType) -> RestAPIResult {
//        let req = setTokenInHeader(request: request, type: type)
        let session = URLSession(configuration: .default)
        var result: RestAPIResult?
        
        print("url: \(request.url)")
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let responseString = String(data: data, encoding: .utf8)
                print("My response --> \(String(describing: responseString))")
            }
            result = RestAPIResult(data: data, response: response as? HTTPURLResponse)
        }
        task.resume()
        while true {
            if let result = result {
                return result
            }
        }
    }
    
    //MARK: Creating A Request
    private func createSendRequest(url: URL, params: [String: Any], contentType: ContentType) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let jsonData = try? JSONSerialization.data(withJSONObject: params)
        request.httpBody = jsonData
        let bodyString = String(data: request.httpBody!, encoding: .utf8)
        print("Body: \(bodyString)")
        request.addValue(contentType.rawValue, forHTTPHeaderField: "Content-Type")
        return request
    }
    
    private func createGetRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
//    private func setTokenInHeader(request: URLRequest, type: APIRequestType) -> URLRequest {
//        guard type != .login && type != .signUp else { //, let token = Info.sharedInstance.token else {
//            return request
//        }
//        var newRequest = request
//        newRequest.addValue(token, forHTTPHeaderField: "token") //key?
//        print(token)
//        return newRequest
//    }
    
    //MARK: Creating Specific Request
    private func createGetPriceRequest() -> URLRequest {
        return createGetRequest(url: APIAddress.getPrice)
    }
    
    private func createGetTweetsRequest() -> URLRequest {
        var request = createGetRequest(url: APIAddress.getTweets)
        request.setValue("Bearer \(Info.sharedInstance.bearer)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    private func createSendTweetRequest(tweet: String) -> URLRequest {
        let params: [String: Any] = jsonSerializer.getSendTweetData(tweet: tweet)
        return createSendRequest(url: APIAddress.sendTweet, params: params as [String: Any], contentType: .json)
    }

    //MARK: Functions
    func getPrice() -> String {
        let result = sendRequest(request: createGetPriceRequest(), type: .price)
        return result.getPrice()
    }
    
    func getTweets() -> [Tweet]? {
        let result = sendRequest(request: createGetTweetsRequest(), type: .getTweets)
        return result.getTweets()
    }
    
    func sendTweet(tweet: String) -> Bool {
        let result = sendRequest(request: createSendTweetRequest(tweet: tweet), type: .sendTweet)
        return result.getPrediction()
    }
}
