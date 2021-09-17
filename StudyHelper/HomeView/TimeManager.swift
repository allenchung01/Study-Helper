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
    var date: Date { Date() }
    let calendar = Calendar.current
    
    var timeOfDay: TimeOfDay {
        let hour = calendar.component(.hour, from: date)
        if hour >= 5 && hour < 12 {
            return .morning
        } else if hour >= 12 && hour < 17 {
            return .noon
        } else {
            return .night
        }
    }
    
    var fullDate: String {
        dateFormatter.string(from: date)
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        return formatter
    }()
}
