//
//  CourseDetailViewModel.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/27/21.
//

import Foundation
import CoreData

class CourseDataViewModel {
    
    func deleteCourse(course: Course, viewContext: NSManagedObjectContext) {
        for assign in course.assignments!.allObjects {
            viewContext.delete(assign as! NSManagedObject)
        }
        for exam in course.exams!.allObjects {
            viewContext.delete(exam as! NSManagedObject)
        }
        viewContext.delete(course)
        saveContext(viewContext: viewContext)
    }
    
    func deleteAllCourses(courses: [Course], viewContext: NSManagedObjectContext) {
        for course in courses {
            deleteCourse(course: course, viewContext: viewContext)
        }
    }
    
    private func saveContext(viewContext: NSManagedObjectContext) {
        do {
            try viewContext.save()
        } catch {
            print("Error saving viewContext. \(error)")
        }
    }
    
}
