//
//  CourseDetailHeader.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/21/21.
//

import SwiftUI

struct CourseDetailHeader: View {
    var course: Course
    
    var body: some View {
        let startTimeText = TimeManager.timeFromDate(date: course.startTime!)
        let endTimeText = TimeManager.timeFromDate(date: course.endTime!)
        VStack(alignment: .leading, spacing: 3) {
            HStack(alignment: .center, spacing: 0) {
                Text(course.name!)
                    .bold()
                    .font(.title)
                Spacer()
            }
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "clock")
                Text(startTimeText)
                Text("-")
                Text(endTimeText)
            }
            .foregroundColor(.secondary)
            .font(.subheadline)
        }
    }
}

struct CourseDetailHeader_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        let course = Course(context: viewContext)
        course.timestamp = Date()
        course.name = "CS 255"
        course.startTime = Date()
        course.endTime = Date()
        course.days = [false, true, false, true, false, true, false]
        return CourseDetailHeader(course: course)
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
