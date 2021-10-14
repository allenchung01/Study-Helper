//
//  NotificationManager.swift
//  StudyHelper
//
//  Created by Allen Chung on 10/14/21.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleCourseNotification(title: String, subtitle: String, time: Date, days: [Int]) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = .default
        //content.badge = 1
        
        var dateComponents = DateComponents()
        dateComponents.hour = Calendar.current.component(.hour, from: time)
        dateComponents.minute = Calendar.current.component(.minute, from: time)
        
        for i in 0..<days.count {
            if days[i] == 1 {
                dateComponents.weekday = i
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                
                let request = UNNotificationRequest(
                    identifier: UUID().uuidString,
                    content: content,
                    trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
    
    /*func scheduleAssignmentNotification(title: String, subtitle: String, date: Date) {
        
    }*/
    
    func cancelNotification(id: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
    }
    
}
