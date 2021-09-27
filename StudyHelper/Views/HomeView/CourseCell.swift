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
                VStack(alignment: .leading, spacing: 10) {
                    if !course.systemImageName!.isEmpty {
                        Image(systemName: course.systemImageName!)
                            .font(.caption)
                            .frame(width: 40, height: 40)
                            //.padding(10)
                            .background(Color.myComplementaryColor)
                            .cornerRadius(10.0)
                    }
                    HStack(alignment: .center, spacing: 10) {
                        Text(course.name!)
                            .fontWeight(.semibold)
                        let date = Date()
                        if TimeManager.compareDates(date1: date, date2: course.startTime!) {
                            CourseProgressTag(progress: .awaitingStart)
                        } else if TimeManager.compareDates(date1: course.endTime!, date2: date) {
                            CourseProgressTag(progress: .concluded)
                        } else {
                            CourseProgressTag(progress: .inProgress)
                        }
                    }
                }
                HStack(alignment: .center, spacing: 6) {
                    //Image(systemName: "clock")
                    Text("\(startTimeString) - \(endTimeString)")
                        .fontWeight(.light)
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
            /*let date = Date()
            if TimeManager.compareDates(date1: date, date2: course.startTime!) {
                CourseProgressTag(progress: .awaitingStart)
            } else if TimeManager.compareDates(date1: course.endTime!, date2: date) {
                CourseProgressTag(progress: .concluded)
            } else {
                CourseProgressTag(progress: .inProgress)
            }*/
        }
        .padding(30)
        .background(Color.myPrimaryBackground)
        .cornerRadius(20.0)
        .background(
            Color.myTertiaryBackground
                .cornerRadius(20.0)
                .padding(10)
                .offset(x: 0, y: -20)
        )
        /*.overlay (
            VStack(alignment: .trailing) {
                Spacer()
                let date = Date()
                if TimeManager.compareDates(date1: date, date2: course.startTime!) {
                    CourseProgressTag(progress: .awaitingStart)
                } else if TimeManager.compareDates(date1: course.endTime!, date2: date) {
                    CourseProgressTag(progress: .concluded)
                } else {
                    CourseProgressTag(progress: .inProgress)
                }
            }
                .offset(x: 0, y: 16)
        )*/
        .shadow(color: .myShadow ,radius: 5, x: 0.0, y: 10.0)
        
    }
}

struct CourseCell_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let course = Course(context: context)
        course.name = "CS 255"
        course.startTime = Date()
        course.endTime = Date()
        course.systemImageName = "laptopcomputer"
        return CourseCell(course: course)
            .padding(30)
            .background(Color.mySecondaryBackground)
            .previewLayout(.sizeThatFits)
    }
}
