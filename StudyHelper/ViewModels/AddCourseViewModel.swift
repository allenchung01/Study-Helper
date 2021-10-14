//
//  AddCourseViewModel.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/20/21.
//

import Foundation
import CoreData

class AddCourseViewModel: ObservableObject {
    
    // Creates a course with given info. Returns true if successful.
    func addCourse(name: String, startTime: Date, endTime: Date, days: [Bool], selectedImageName: String, viewContext: NSManagedObjectContext) -> Bool {
        guard isInfoFilledOut(name: name) else { return false }
        
        let course = Course(context: viewContext)
        course.name = name
        course.startTime = startTime
        course.endTime = endTime
        course.timestamp = Date()
        course.days = days
        course.systemImageName = selectedImageName
                                
        save(viewContext: viewContext)
        return true
    }
    
    // Verifies that all fields are filled out.
    private func isInfoFilledOut(name: String) -> Bool {
        if name.isEmpty {
            return false
        }
        return true
    }
    
    private func save(viewContext: NSManagedObjectContext) {
        do {
            try viewContext.save()
        } catch {
            print("Error saving viewContext. \(error)")
        }
    }
    
}
