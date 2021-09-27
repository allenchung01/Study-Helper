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
        viewContext.delete(course)
        saveContext(viewContext: viewContext)
    }
    
    private func saveContext(viewContext: NSManagedObjectContext) {
        do {
            try viewContext.save()
        } catch {
            print("Error saving viewContext. \(error)")
        }
    }
    
}
