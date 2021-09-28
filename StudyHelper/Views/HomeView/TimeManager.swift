//
//  TimeManager.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import Foundation

enum TimeOfDay {
    case morning
    case noon
    case night
}

class TimeManager {
    
    static let calendar = Calendar.current
    
    static var timeOfDay: TimeOfDay {
        let date = Date()
        let hour = calendar.component(.hour, from: date)
        if hour >= 5 && hour < 12 {
            return .morning
        } else if hour >= 12 && hour < 17 {
            return .noon
        } else {
            return .night
        }
    }
    
    // Example: Friday, September 17, 2021
    static var fullDate: String {
        let date = Date()
        return dateFormatter.string(from: date)
    }
    
    // Example: 1:00 pm
    static func timeFromDate(date: Date) -> String {
        return timeFormatter.string(from: date)
    }
    
    static func dueDate(from date: Date) -> String {
        return dueDateFormatter.string(from: date)
    }
    
    static func startOfDay() -> Date {
        return calendar.startOfDay(for: Date())
    }
    
    static func getCurrentDay() -> Int {
        let date = Date()
        return calendar.component(.weekday, from: date) - 1
    }
    
    // Returns true if date1 is less than date2.
    static func compareDates(date1: Date, date2: Date) -> Bool {
        var newDate = Date(timeIntervalSince1970: 0)
        var newDate2 = Date(timeIntervalSince1970: 0)
        
        let newDateComponents = calendar.dateComponents([.hour, .minute], from: date1)
        let newDate2Components = calendar.dateComponents([.hour, .minute], from: date2)
        newDate = calendar.date(byAdding: newDateComponents, to: newDate)!
        newDate2 = calendar.date(byAdding: newDate2Components, to: newDate2)!
        
        return newDate < newDate2
    }
    
    private static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        return formatter
    }()
    
    private static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        let template = "EEEEdMMMhm"
        let format = DateFormatter.dateFormat(fromTemplate: template, options: 0, locale: NSLocale.current)
        formatter.dateFormat = format
        /*formatter.dateStyle = .full
        formatter.timeStyle = .short*/
        return formatter
    }()
}

extension Calendar {
    func numberOfDaysBetween(from: Date, to: Date) -> Int {
        let fromDate = startOfDay(for: from)
        let toDate = startOfDay(for: to)
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate)
        return numberOfDays.day!
    }
}
