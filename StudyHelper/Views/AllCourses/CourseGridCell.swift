//
//  CourseGridCell.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/24/21.
//

import SwiftUI

struct CourseGridCell: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var course: Course
    /*private var startTimeString: String
    private var endTimeString: String*/
    
    init(course: Course) {
        self.course = course
        /*startTimeString = TimeManager.timeFromDate(date: course.startTime!)
        endTimeString = TimeManager.timeFromDate(date: course.endTime!)*/
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if course.name != nil {
            VStack(alignment: .leading, spacing: 3) {
                if !course.systemImageName!.isEmpty {
                    Image(systemName: course.systemImageName!)
                        .foregroundColor(.black)
                        .font(.caption)
                        .frame(width: 40, height: 40)
                        //.padding(10)
                        .background(Color.myComplementaryColor)
                        .cornerRadius(10.0)
                }
                Spacer()
                HStack(alignment: .center, spacing: 10) {
                    Text(course.name!)
                        .bold()
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    /*if !course.systemImageName!.isEmpty {
                        Image(systemName: course.systemImageName!)
                    }*/
                }
                HStack {
                    course.days![0] == true ? Text("Sun").fontWeight(.light) : nil
                    course.days![1] == true ? Text("Mon").fontWeight(.light) : nil
                    course.days![2] == true ? Text("Tue").fontWeight(.light) : nil
                    course.days![3] == true ? Text("Wed").fontWeight(.light) : nil
                    course.days![4] == true ? Text("Thu").fontWeight(.light) : nil
                    course.days![5] == true ? Text("Fri").fontWeight(.light) : nil
                    course.days![6] == true ? Text("Sat").fontWeight(.light) : nil
                }
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(1)
                /*HStack(alignment: .center, spacing: 6) {
                    //Image(systemName: "clock")
                    Text("\(startTimeString) - \(endTimeString)")
                }
                .font(.caption)
                .foregroundColor(.secondary)*/
            }
            }
        }
        .padding(30)
        .frame(height: 180, alignment: .bottomLeading)
        .background(Color.myPrimaryBackground)
        .cornerRadius(20.0)
        .background(
            Color.myTertiaryBackground
                .cornerRadius(20.0)
                .padding(10)
                .offset(x: 0, y: -20)
        )
        .shadow(color: .myShadow ,radius: 5, x: 0.0, y: 10.0)
        
    }
}

struct CourseGridCell_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let course = Course(context: context)
        course.name = "CS 255"
        course.startTime = Date()
        course.endTime = Date()
        return CourseGridCell(course: course)
            .padding(30)
            .background(Color.mySecondaryBackground)
            .previewLayout(.sizeThatFits)
    }
}
