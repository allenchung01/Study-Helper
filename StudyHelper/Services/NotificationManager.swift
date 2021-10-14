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
    
    func scheduleCourseNotification(title: String, subtitle: String, time: Date, days: [Bool], course: Course) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = subtitle
        content.sound = .default
        
        let notificationTime = time.addingTimeInterval(-15 * 60)
        
        var dateComponents = DateComponents()
        dateComponents.hour = Calendar.current.component(.hour, from: notificationTime)
        dateComponents.minute = Calendar.current.component(.minute, from: notificationTime)
        
        for i in 0..<days.count {
            if days[i] == true {
                dateComponents.weekday = i + 1
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                
                let id = UUID().uuidString
                if course.notifications != nil {
                    course.notifications?.append(id)
                } else {
                    course.notifications = [id]
                }
                
                let request = UNNotificationRequest(
                    identifier: id,
                    content: content,
                    trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
    
    func scheduleAssignmentNotification(title: String, subtitle: String, date: Date, assignment: Assignment) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = subtitle
        content.sound = .default
        
        //let notificationTime = time.addingTimeInterval(-15 * 60)
        
        var dateComponents = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: date)
        dateComponents.day = dateComponents.day! - 1
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let id = UUID().uuidString
        if assignment.notifications != nil {
            assignment.notifications?.append(id)
        } else {
            assignment.notifications = [id]
        }
        
        let request = UNNotificationRequest(
            identifier: id,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func scheduleExamNotification(title: String, subtitle: String, date: Date, exam: Exam) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = subtitle
        content.sound = .default
        
        let notificationTime = date.addingTimeInterval(-15 * 60)
        let dateComponents = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: notificationTime)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let id = UUID().uuidString
        if exam.notifications != nil {
            exam.notifications?.append(id)
        } else {
            exam.notifications = [id]
        }
        
        let request = UNNotificationRequest(
            identifier: id,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification(course: Course) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: course.notifications ?? [])
    }
    
    func cancelNotification(assignment: Assignment) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: assignment.notifications ?? [])
    }
    
    func cancelNotification(exam: Exam) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: exam.notifications ?? [])
    }
    
}
