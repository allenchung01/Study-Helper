//
//  Persistence.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        // Sample Data
        let course = Course(context: viewContext)
        course.timestamp = Date()
        course.name = "CS 141"
        course.startTime = Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!
        course.endTime = Calendar.current.date(bySettingHour: 8, minute: 50, second: 0, of: Date())!
        course.days = [true, true, false, true, false, true, false]
        course.systemImageName = "laptopcomputer"
        let assignment = Assignment(context: viewContext)
        assignment.name = "Homework 1"
        assignment.timestamp = Date()
        assignment.dueDate = Calendar.current.date(bySettingHour: 23, minute: 30, second: 0, of: Date())!
        assignment.isCompleted = false
        let assignment2 = Assignment(context: viewContext)
        assignment2.name = "Homework 2"
        assignment2.timestamp = Date()
        assignment2.dueDate = Calendar.current.date(bySettingHour: 22, minute: 30, second: 0, of: Date())!
        assignment2.isCompleted = true
        course.assignments = [assignment, assignment2]
        
        let course2 = Course(context: viewContext)
        course2.timestamp = Date()
        course2.name = "MATH 210"
        /*course2.startTime = Calendar.current.date(bySettingHour: 11, minute: 30, second: 0, of: Date())!
        course2.endTime = Calendar.current.date(bySettingHour: 12, minute: 20, second: 0, of: Date())!*/
        course2.startTime = Calendar.current.date(bySettingHour: 22, minute: 50, second: 0, of: Date())!
        course2.endTime = Calendar.current.date(bySettingHour: 23, minute: 0, second: 0, of: Date())!
        course2.days = [true, true, false, true, false, true, false]
        course2.systemImageName = "x.squareroot"
        
        let course3 = Course(context: viewContext)
        course3.timestamp = Date()
        course3.name = "MUS 107"
        /*course3.startTime = Calendar.current.date(bySettingHour: 16, minute: 0, second: 0, of: Date())!
        course3.endTime = Calendar.current.date(bySettingHour: 16, minute: 50, second: 0, of: Date())!*/
        course3.startTime = Calendar.current.date(bySettingHour: 23, minute: 0, second: 0, of: Date())!
        course3.endTime = Calendar.current.date(bySettingHour: 23, minute: 50, second: 0, of: Date())!
        course3.days = [true, true, false, true, false, true, false]
        course3.systemImageName = "music.note"
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "StudyHelper")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
