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
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading, spacing: 3) {
                HStack(alignment: .center, spacing: 0) {
                    Text(course.name!)
                        .fontWeight(.semibold)
                        .font(.title)
                    Spacer()
                }
                HStack(spacing: 10) {
                    course.days![0] == true ? Text("Sun").fontWeight(.light) : nil
                    course.days![1] == true ? Text("Mon").fontWeight(.light) : nil
                    course.days![2] == true ? Text("Tue").fontWeight(.light) : nil
                    course.days![3] == true ? Text("Wed").fontWeight(.light) : nil
                    course.days![4] == true ? Text("Thu").fontWeight(.light) : nil
                    course.days![5] == true ? Text("Fri").fontWeight(.light) : nil
                    course.days![6] == true ? Text("Sat").fontWeight(.light) : nil
                }
                .foregroundColor(.secondary)
                .font(.subheadline)
                HStack(alignment: .center, spacing: 10) {
                    //Image(systemName: "clock")
                    Text(startTimeText)
                        .fontWeight(.light)
                    Text("-")
                        .fontWeight(.light)
                    Text(endTimeText)
                        .fontWeight(.light)
                }
                .foregroundColor(.secondary)
                .font(.subheadline)
            }
            .padding(.top, 10)
            Image(systemName: course.systemImageName!)
                .frame(width: 60, height: 60)
                .font(.title2)
                .background(Color.myComplementaryColor)
                .cornerRadius(10.0)
                .shadow(color: .myShadow ,radius: 5, x: 0.0, y: 10.0)
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
        course.systemImageName = "laptopcomputer"
        return CourseDetailHeader(course: course)
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
