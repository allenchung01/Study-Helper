//
//  AssignmentRow.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/22/21.
//

import SwiftUI

struct AssignmentRow: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var assignment: Assignment
    
    @State private var offset: CGFloat = 0.0
    
    private let assignmentsService = AssignmentsService()
    
    var body: some View {
        ZStack {
            // Deletion View underneath
            HStack(alignment: .center, spacing: 0) {
                Spacer()
                Text("Delete")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .padding(20)
            .background(Color.myErrorRed.opacity(offset < -160 ? 1.0 : 0.4))
            .cornerRadius(15.0)
            // Actual Cell
            ZStack {
            if assignment.name != nil {
            HStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading, spacing: 3) {
                    if !assignment.isFault && assignment.course != nil {
                        HStack(alignment: .center, spacing: 10) {
                            Text(assignment.course!.name!)
                                .font(.subheadline)
                        }
                        .foregroundColor(.secondary)
                        HStack(spacing: 10) {
                            Text(assignment.name!)
                                .fontWeight(.semibold)
                                .if(assignment.isCompleted, transform: {
                                    $0.strikethrough()
                                })
                            CheckBox(selected: assignment.isCompleted, onToggle: {
                                assignment.isCompleted.toggle()
                                saveContext()
                            })
                        }
                        let date = Date()
                        let daysUntilDue = Calendar.current.numberOfDaysBetween(from: date, to: assignment.dueDate!)
                        Text(TimeManager.dueDate(from: assignment.dueDate!))
                            .font(.caption)
                            .foregroundColor(
                                daysUntilDue >= 0 || assignment.isCompleted == true ? .secondary : .myErrorRed
                            )
                            .fontWeight(.light)
                    }
                }
                Spacer()
            }
            .padding(30)
            .background(Color.myPrimaryBackground)
            .cornerRadius(20.0)
            .shadow(color: .myShadow ,radius: 5, x: 0.0, y: 10.0)
            .gesture (
                DragGesture(minimumDistance: 15, coordinateSpace: .global)
                    .onChanged({ value in
                        let width = value.translation.width
                        if width < 0 {
                            offset = width
                        }
                    })
                    .onEnded({ value in
                        let width = value.translation.width
                        if width < -160 {
                            assignmentsService.deleteAssignment(assignment: assignment, viewContext: viewContext)
                        } else {
                            offset = 0
                        }
                    })
            )
                if assignment.course != nil {
            if !assignment.course!.systemImageName!.isEmpty {
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: assignment.course!.systemImageName!)
                            .foregroundColor(.black)
                            .font(.caption2)
                            .frame(width: 36, height: 36)
                            //.padding(0)
                            .background(Color.myComplementaryColor3)
                            .cornerRadius(10.0)
                            .padding(30)
                    }
                }
            }
                }
            }
        }
            .offset(x: offset, y: 0)
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving view context. \(error)")
        }
    }
}

struct AssignmentRow_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        let assignment = Assignment(context: viewContext)
        assignment.name = "Homework 1"
        assignment.dueDate = Date()
        assignment.isCompleted = false
        assignment.timestamp = Date()
        
        let course = Course(context: viewContext)
        course.name = "CS 255"
        course.systemImageName = "laptopcomputer"
        assignment.course = course
        
        return AssignmentRow(assignment: assignment)
            .padding(30)
            .background(Color.mySecondaryBackground)
            .previewLayout(.sizeThatFits)
    }
}
