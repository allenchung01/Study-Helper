//
//  CourseCell.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import SwiftUI

struct CourseCell: View {
    private var course: Course
    private var startTimeString: String
    private var endTimeString: String
    
    init(course: Course) {
        self.course = course
        startTimeString = TimeManager.timeFromDate(date: course.startTime!)
        endTimeString = TimeManager.timeFromDate(date: course.endTime!)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 3) {
                Text(course.name!)
                    .bold()
                HStack(alignment: .center, spacing: 6) {
                    Image(systemName: "clock")
                    Text("\(startTimeString) - \(endTimeString)")
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
            Text("Awaiting Start") // In Progress(green) // Concluded(red)
                .font(.caption)
                .foregroundColor(.blue)
                .padding(.vertical, 6)
                .padding(.horizontal, 12)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(.greatestFiniteMagnitude)
                //.cornerRadius(5.0)
        }
        .padding(30)
        .background(Color.myPrimaryBackground)
        .cornerRadius(20.0)
        .shadow(color: .myShadow ,radius: 10, x: 0.0, y: 5.0)
    }
}

struct CourseCell_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let course = Course(context: context)
        course.name = "CS 255"
        course.startTime = Date()
        course.endTime = Date()
        return CourseCell(course: course)
            .padding(30)
            .background(Color.mySecondaryBackground)
            .previewLayout(.sizeThatFits)
    }
}
