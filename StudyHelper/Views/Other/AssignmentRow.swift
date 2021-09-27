//
//  AssignmentRow.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/22/21.
//

import SwiftUI

struct AssignmentRow: View {
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
                    .bold()
                    .foregroundColor(.white)
            }
            .padding(20)
            .background(Color(.systemRed).opacity(offset < -160 ? 0.9 : 0.4))
            .cornerRadius(15.0)
            // Actual Cell
            HStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading, spacing: 3) {
                    if !assignment.isFault && assignment.course != nil {
                        HStack(alignment: .center, spacing: 10) {
                            Text(assignment.course!.name!)
                                .font(.subheadline)
                            if !assignment.course!.systemImageName!.isEmpty {
                                Image(systemName: assignment.course!.systemImageName!)
                                    .font(.subheadline)
                            }
                        }
                        .foregroundColor(.secondary)
                        HStack(spacing: 10) {
                            Text(assignment.name!)
                                .bold()
                                .if(assignment.isCompleted, transform: {
                                    $0.strikethrough()
                                })
                            CheckBox(selected: assignment.isCompleted, onToggle: {
                                assignment.isCompleted.toggle()
                                saveContext()
                            })
                        }
                        Text(TimeManager.dueDate(from: assignment.dueDate!))
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                Spacer()
            }
            .padding(30)
            .background(Color.myPrimaryBackground)
            .cornerRadius(20.0)
            .shadow(color: .myShadow ,radius: 5, x: 0.0, y: 10.0)
            .offset(x: offset, y: 0)
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
        
        let course = Course(context: viewContext)
        course.name = "CS 255"
        assignment.course = course
        
        return AssignmentRow(assignment: assignment)
            .padding(30)
            .background(Color.mySecondaryBackground)
            .previewLayout(.sizeThatFits)
    }
}
