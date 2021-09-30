//
//  ExamService.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/30/21.
//

import Foundation
import CoreData

class ExamService {
    
    func createExam(name: String, date: Date, course: Course, viewContext: NSManagedObjectContext) -> Bool {
        guard areFieldsFilled(name: name) else { return false }
        let exam = Exam(context: viewContext)
        exam.name = name
        exam.date = date
        exam.course = course
        exam.timestamp = Date()
        saveContext(viewContext: viewContext)
        return true
    }
    
    func deleteExam(exam: Exam, viewContext: NSManagedObjectContext) {
        viewContext.delete(exam)
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

