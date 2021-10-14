//
//  AssignmentsService.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/22/21.
//

import Foundation
import CoreData

class AssignmentsService {
    
    func createAssignment(name: String, dueDate: Date, course: Course, viewContext: NSManagedObjectContext) -> Bool {
        guard areFieldsFilled(name: name) else { return false }
        let assignment = Assignment(context: viewContext)
        assignment.name = name
        assignment.dueDate = dueDate
        assignment.course = course
        assignment.isCompleted = false
        assignment.timestamp = Date()
        
        NotificationManager.instance.scheduleAssignmentNotification(title: name, subtitle: "Assignment Due Tomorrow", date: dueDate, assignment: assignment)
        
        saveContext(viewContext: viewContext)
        return true
    }
    
    func deleteAssignment(assignment: Assignment, viewContext: NSManagedObjectContext) {
        
        NotificationManager.instance.cancelNotification(assignment: assignment)
        
        viewContext.delete(assignment)
        saveContext(viewContext: viewContext)
    }
    
    private func areFieldsFilled(name: String) -> Bool {
        if name.isEmpty {
            return false
        }
        return true
    }
    
    private func saveContext(viewContext: NSManagedObjectContext) {
        do {
            try viewContext.save()
        } catch {
            print("Error saving view context. \(error)")
        }
    }
    
}
