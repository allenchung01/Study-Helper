//
//  ExamCell.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/30/21.
//

import SwiftUI

struct ExamCell: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var exam: Exam
    
    @State private var offset: CGFloat = 0.0
    
    private let examService = ExamService()
    
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
            if exam.name != nil {
            HStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading, spacing: 3) {
                    if !exam.isFault && exam.course != nil {
                        HStack(alignment: .center, spacing: 10) {
                            Text(exam.course!.name!)
                                .font(.subheadline)
                        }
                        .foregroundColor(.secondary)
                        HStack(spacing: 10) {
                            Text(exam.name!)
                                .fontWeight(.semibold)
                                .if(exam.date! < Date(), transform: {
                                    $0.strikethrough()
                                })
                        }
                        Text(TimeManager.dueDate(from: exam.date!))
                            .font(.caption)
                            .foregroundColor(.secondary)
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
                            examService.deleteExam(exam: exam, viewContext: viewContext)
                        } else {
                            offset = 0
                        }
                    })
            )
                if exam.course != nil {
            if !exam.course!.systemImageName!.isEmpty {
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: exam.course!.systemImageName!)
                            .font(.caption2)
                            .frame(width: 36, height: 36)
                            //.padding(0)
                            .background(Color.myComplementaryColor4)
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

struct ExamCell_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        let exam = Exam(context: viewContext)
        exam.name = "Midterm 1"
        exam.date = Date()
        exam.timestamp = Date()
        
        let course = Course(context: viewContext)
        course.name = "CS 255"
        course.systemImageName = "laptopcomputer"
        exam.course = course
        
        return ExamCell(exam: exam)
            .padding(30)
            .background(Color.mySecondaryBackground)
            .previewLayout(.sizeThatFits)
    }
}
