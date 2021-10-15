//
//  ExamsList.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/30/21.
//

import SwiftUI

struct ExamsList: View {
    @Environment(\.colorScheme) var colorScheme
    
    var course: Course?
    
    @Binding var numDays: NumDays
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Exam.date, ascending: false)],
        animation: .default)
    private var exams: FetchedResults<Exam>
    
    var body: some View {
        let filtered1 = filter(exams: exams, by: course)
        let filtered2 = filter(exams: filtered1, by: numDays).sorted(by: examSorter(a:b:))
        return VStack(spacing: 20) {
            
            /*let filtered2 = filter(assignments: assignments, by: course).sorted(by: assignmentSorter(a:b:))*/
            if !filtered2.isEmpty {
                ForEach(filtered2, id: \.self) { exam in
                    ExamCell(exam: exam)
                    //Text(assignment.name!)
                }
            } else {
                ZStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 20) {
                        TemplateExamCell(name: "Midterm 1", course: "CS 141", date: "Wednesday, Sep 29, 12:00 AM",  systemImageName: "laptopcomputer")
                        /*TemplateExamCell(name: "Midterm 2", course: "MUS 107", date: "Thursday, Sep 30, 12:00 AM",  systemImageName: "music.note")*/
                    }
                    .opacity(0.5)
                    .blur(radius: 3.0)
                    Text("No Exams")
                        .foregroundColor(.primary)
                        .padding(26)
                        .background(Color.myPrimaryBackground.opacity(0.8))
                        .cornerRadius(20.0)
                        .shadow(color: .myShadow ,radius: 5, x: 0.0, y: 10.0)
                        .padding(30)
                }
            }
        }
    }
    
    // Filters out exams that don't belong to specified course.
    private func filter(exams: FetchedResults<Exam>, by course: Course?) -> [Exam] {
        guard course != nil else { return Array(exams) }
        return exams.filter({ exam in
            if exam.course == self.course {
                return true
            } else {
                return false
            }
        })
    }
    
    private func filter(exams: [Exam], by numDays: NumDays) -> [Exam] {
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
            return exams
        }
        let currDate = Date()
        return exams.filter({ exam in
            let date = exam.date!
            let days = Calendar.current.numberOfDaysBetween(from: currDate, to: date)
            if days <= num {
                if days < 0 {
                    // Exam already happened
                    return false
                }
                return true
            } else {
                return false
            }
        })
    }
    
    private func examSorter(a: Exam, b: Exam) -> Bool {
        let date = Date()
        let date1 = a.date!
        let date2 = b.date!
        if date1 < date {
            if date2 < date {
                if date1 < date2 {
                    return false
                } else {
                    return true
                }
            }
            return false
        } else {
            if date2 < date {
                return true
            }
            if date1 < date2 {
                return true
            } else {
                return false
            }
        }
        
        /*if a.isCompleted {
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
        }*/
    }
}

struct ExamsList_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        let course = Course(context: viewContext)
        course.timestamp = Date()
        course.name = "CS 255"
        course.startTime = Date()
        course.endTime = Date()
        course.systemImageName = "laptopcomputer"
        course.days = [false, true, false, true, false, true, false]
        
        let exam = Exam(context: viewContext)
        exam.name = "Midterm 1"
        exam.date = Date()
        exam.timestamp = Date()
        let exam2 = Exam(context: viewContext)
        exam2.name = "Midterm 2"
        exam2.date = Date()
        exam2.timestamp = Date()
        
        course.exams = [exam, exam2]
        return ExamsList(course: course, numDays: .constant(.allAssignments))
            .environment(\.managedObjectContext, viewContext)
            .padding(30)
            .background(Color.mySecondaryBackground)
            .previewLayout(.sizeThatFits)
    }
}
