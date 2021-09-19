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
}
