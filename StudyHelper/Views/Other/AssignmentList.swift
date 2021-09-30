//
//  AssignmentList.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/21/21.
//

import SwiftUI

struct AssignmentList: View {
    var course: Course?
    
    @Binding var numDays: NumDays
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Assignment.dueDate, ascending: false)],
        animation: .default)
    private var assignments: FetchedResults<Assignment>
    
    var body: some View {
        let filtered1 = filter(assignments: assignments, by: course)
        let filtered2 = filter(assignments: filtered1, by: numDays).sorted(by: assignmentSorter(a:b:))
        return VStack(spacing: 20) {
            
            /*let filtered2 = filter(assignments: assignments, by: course).sorted(by: assignmentSorter(a:b:))*/
            if !filtered2.isEmpty {
                ForEach(filtered2, id: \.self) { assignment in
                    AssignmentRow(assignment: assignment)
                    //Text(assignment.name!)
                }
            } else {
                ZStack {
                    VStack(alignment: .leading, spacing: 20) {
                        TemplateAssignmentRow(name: "Homework 1", course: "CS 141", dueDate: "Wednesday, Sep 29, 12:00 AM", isCompleted: false, systemImageName: "laptopcomputer")
                        TemplateAssignmentRow(name: "Worksheet 1", course: "MUS 107", dueDate: "Thursday, Sep 30, 12:00 AM", isCompleted: true, systemImageName: "music.note")
                    }
                    .opacity(0.5)
                    .blur(radius: 3.0)
                    Text("No Assignments")
                        .fontWeight(.semibold)
                }
            }
        }
    }
    
    // Filters out assignments that don't belong to specified course.
    private func filter(assignments: FetchedResults<Assignment>, by course: Course?) -> [Assignment] {
        guard course != nil else { return Array(assignments) }
        return assignments.filter({ assignment in
            if assignment.course == self.course {
                return true
            } else {
                return false
            }
        })
    }
    
    private func filter(assignments: [Assignment], by numDays: NumDays) -> [Assignment] {
        var num = 0
        switch numDays {
        case .oneDay:
            num = 1
        case .threeDays:
            num = 3
        case .oneWeek:
            num = 7
        case .twoWeeks:
            num = 14
        case .oneMonth:
            num = 31
        case .allAssignments:
            return assignments
        }
        let date = Date()
        return assignments.filter({ assignment in
            let dueDate = assignment.dueDate!
            let days = Calendar.current.numberOfDaysBetween(from: date, to: dueDate)
            if days <= num {
                if days < 0 {
                    // Assignment is past due date
                    if assignment.isCompleted == false {
                        return true
                    } else  {
                        return false
                    }
                }
                return true
            } else {
                return false
            }
        })
    }
    
    private func assignmentSorter(a: Assignment, b: Assignment) -> Bool {
        if a.isCompleted {
            // Move completed assignments to bottom of list.
            if b.isCompleted {
                if a.dueDate! < b.dueDate! {
                    return false
                } else {
                    return true
                }
            } else {
                return false
            }
        } else {
            return true
        }
    }
}

struct AssignmentList_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        let course = Course(context: viewContext)
        course.timestamp = Date()
        course.name = "CS 255"
        course.startTime = Date()
        course.endTime = Date()
        course.systemImageName = "laptopcomputer"
        course.days = [false, true, false, true, false, true, false]
        
        let assignment = Assignment(context: viewContext)
        assignment.name = "Homework 1"
        assignment.dueDate = Date()
        assignment.isCompleted = false
        assignment.timestamp = Date()
        let assignment2 = Assignment(context: viewContext)
        assignment2.name = "Homework 2"
        assignment2.dueDate = Date()
        assignment2.isCompleted = false
        assignment2.timestamp = Date()
        
        course.assignments = [assignment, assignment2]
        return AssignmentList(course: course, numDays: .constant(.oneWeek))
            .environment(\.managedObjectContext, viewContext)
            .padding(30)
            .background(Color.mySecondaryBackground)
            .previewLayout(.sizeThatFits)
    }
}
