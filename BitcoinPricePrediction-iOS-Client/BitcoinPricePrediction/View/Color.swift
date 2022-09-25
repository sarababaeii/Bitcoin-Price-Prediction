//
//  Color.swift
//  BitcoinPricePrediction
//
//  Created by Sara Babaei on 1/26/21.
//  Copyright © 2021 Sara Babaei. All rights reserved.
//

import Foundation
import UIKit

enum Color {
    case red
    case green
    case gray
    
    //MARK: Component Colors
    var componentColor: UIColor {
        switch self {
        case .red:
            return UIColor(red: 255/255, green: 45/255, blue: 85/255, alpha: 1)
        case .green:
            return UIColor(red: 48/255, green: 188/255, blue: 150/255, alpha: 1)
        case .gray:
            return UIColor(red: 135/255, green: 135/255, blue: 135/255, alpha: 1)
        }
    }
}
