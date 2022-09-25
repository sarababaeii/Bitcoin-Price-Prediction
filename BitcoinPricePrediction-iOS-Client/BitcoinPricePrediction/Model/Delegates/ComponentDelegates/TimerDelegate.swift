//
//  TimerDelegate.swift
//  BitcoinPricePrediction
//
//  Created by Sara Babaei on 1/26/21.
//  Copyright © 2021 Sara Babaei. All rights reserved.
//

import Foundation
import UIKit

class TimerDelegate {
    var timer: Timer?
    let label: UILabel
    
    init(label: UILabel) {
        self.label = label
        
        on()
    }
    
    func on() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    func off() {
        timer?.invalidate()
    }
    
    @objc func updateCounter() {
        setTimerLabel()
    }
    
    func setTimerLabel() {
        label.text = Date().getTimeString()
    }
}
