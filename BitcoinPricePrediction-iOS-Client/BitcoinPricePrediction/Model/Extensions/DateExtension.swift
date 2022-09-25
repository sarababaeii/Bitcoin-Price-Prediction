//
//  DateExtension.swift
//  BitcoinPricePrediction
//
//  Created by Sara Babaei on 1/26/21.
//  Copyright © 2021 Sara Babaei. All rights reserved.
//

import Foundation

extension Date {
    //MARK: Getting Specific Dates
    static func getDate(from date: String) -> Date? {
        let formatter = Date.getDateFormatterWithStyle(format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ", dateStyle: nil, timeStyle: nil)
        return formatter.date(from: date)
    } //  "2021-01-26T01:13:23.000Z"
    
    //MARK: Setting Date Formatter
    private static func getDateFormatterWithStyle(format: String?, dateStyle: DateFormatter.Style?, timeStyle: DateFormatter.Style?) -> DateFormatter {
        let formatter = DateFormatter()
        if let format = format {
            formatter.dateFormat = format
        }
        if let dateStyle = dateStyle {
            formatter.dateStyle = dateStyle
        }
        if let timeStyle = timeStyle {
            formatter.timeStyle = timeStyle
        }
        return formatter
    }
    
    //MARK: English Strings
    func toDBFormatDateAndTimeString() -> String {
        let formatter = Date.getDateFormatterWithStyle(format: "yyyy-MM-dd HH:mm:ss", dateStyle: nil, timeStyle: nil)
        return formatter.string(from: self)
    }
    
    func getTimeString() -> String {
        let formatter = Date.getDateFormatterWithStyle(format: "HH:mm:ss", dateStyle: nil, timeStyle: nil)
        return formatter.string(from: self)
    }
    
    func getHourString() -> String {
        let formatter = Date.getDateFormatterWithStyle(format: "HH", dateStyle: nil, timeStyle: nil)
        return formatter.string(from: self)
    }

    func getMinString() -> String {
        let formatter = Date.getDateFormatterWithStyle(format: "mm", dateStyle: nil, timeStyle: nil)
        return formatter.string(from: self)
    }
    
    //MARK: Persian Strings
    func toWeekDMonth() -> String { // panjshanbe 15 aban
        return toWeekDayString() + " " + toDayString() + " " + toMonthString()
    }
    
    func toWeekDayString() -> String { // shanbe
        let formatter = Date.getDateFormatterWithStyle(format: "EEEE", dateStyle: nil, timeStyle: nil)
        return formatter.string(from: self)
    }
    
    func toDayString() -> String { // 15
        let formatter = Date.getDateFormatterWithStyle(format: "dd", dateStyle: nil, timeStyle: nil)
        let str = formatter.string(from: self)
        if str[0] == "۰" {
            return str[1]
        }
        return str
    }
    
    func toMonthString() -> String { // aban
        let formatter = Date.getDateFormatterWithStyle(format: "MM", dateStyle: nil, timeStyle: nil)
        let monthNumber = formatter.string(from: self).convertPersianNumToEnglishNum()
        return formatter.monthSymbols[Int(monthNumber)! - 1]
    }
    
    func toDMHmString() -> String {
        return "\(toDayString()) \(toMonthString())  \(getHourString()):\(getMinString())"
    }
}
