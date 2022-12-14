//
//  StringExtension.swift
//  BitcoinPricePrediction
//
//  Created by Sara Babaei on 1/26/21.
//  Copyright © 2021 Sara Babaei. All rights reserved.
//

import Foundation

extension String {
    
    public var displayValue: String {
        return self
    }
    
    public var valueToRetrive: Any {
        return self
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, count) ..< count]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(count, r.lowerBound)), upper: min(count, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    func convertEnglishNumToPersianNum() -> String {
        let format = NumberFormatter()
        format.locale = Locale(identifier: "fa_IR")
        
        let number = format.number(from: self)
        let faNumber = format.string(from: number!)
        
        return faNumber!
    }
    
    func makeTwoDigitPersian() -> String {
        switch self.count {
        case 0:
            return "۰۰"
        case 1:
            return "۰\(self)"
        default:
            return self
        }
    }
    
    func convertPersianNumToEnglishNum() -> String {
        let format = NumberFormatter()
        format.locale = Locale(identifier: "En")
        
        let number = format.number(from: self)
        let enNumber = format.string(from: number!)
        
        return enNumber!
    }
    
    func toPriceInt() -> Int? {
        return Int(self.deletePriceSeperators(separator: "."))
    }
    
    static func toPersianPriceString(price: Int) -> String {
        return String(price).convertEnglishNumToPersianNum().toPriceString(separator: ".", willAdd: nil)
    }
    
    func deletePriceSeperators(separator: String) -> String {
        var ans = ""
        for i in 0 ..< self.count {
            if self[i] != separator {
                ans += self[i]
            }
        }
        return ans
    }
    
    func toPriceString(separator: String, willAdd: String?) -> String {
        let rawString = self.deletePriceSeperators(separator: separator)
        let size = rawString.calculateSize(willAdd: willAdd)
        let st = rawString.firstDotIndex(size: size)
        var ans = ""
        for i in 0 ..< rawString.count {
            if (i - st) % 3 == 0 && i >= st && i != rawString.count - 1 {
                ans += separator
            }
            ans += rawString[i]
        }
        return ans
    }
    
    private func calculateSize(willAdd: String?) -> Int {
        if let char = willAdd {
            if char != "" {
                return self.count + 1
            }
            return self.count - 1
        }
        return self.count
    }
    
    func firstDotIndex(size: Int) -> Int {
        switch size % 3 {
        case 0:
            return 3
        case 1:
            return 1
        case 2:
            return 2
        default:
            return 0
        }
    }
}
