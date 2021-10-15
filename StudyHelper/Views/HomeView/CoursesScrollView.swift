//
//  CoursesScrollView.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import SwiftUI

struct CoursesScrollView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Course.timestamp, ascending: true)],
        animation: .default)
    private var courses: FetchedResults<Course>
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                let filteredCourses = filterCoursesByDate(courses: courses)
                if filteredCourses.count != 0 {
                    ForEach(filteredCourses, id: \.self) { course in
                        CourseCell(course: course)
                    }
                } else {
                    ZStack(alignment: .leading) {
                        HStack(alignment: .center, spacing: 20) {
                            TemplateCourseCell(name: "CS 141", systemImageName: "laptopcomputer", startTime: "1:00 PM", endTime: "1:50 PM", progress: .awaitingStart)
                            TemplateCourseCell(name: "MUS 107", systemImageName: "music.note", startTime: "3:00 PM", endTime: "3:50 PM", progress: .awaitingStart)
                        }
                        .opacity(0.5)
                        .blur(radius: 3.0)
                        Text("No Courses Today")
                            .foregroundColor(.primary)
                            .padding(26)
                            .background(Color.myPrimaryBackground.opacity(0.8))
                            .cornerRadius(20.0)
                            .shadow(color: .myShadow ,radius: 5, x: 0.0, y: 10.0)
                            .padding(30)
                    }
                }
            }
            .padding(30)
        }
    }
    
    // Filters out courses that aren't on the current day, sorts by order of conclusion
    func filterCoursesByDate(courses: FetchedResults<Course>) -> [Course] {
        let day = TimeManager.getCurrentDay()
        let filteredCourses = courses.filter({ course in
            return course.days![day]
        })
        // Sort courses by concluded vs not concluded
        let sortedCourses = filteredCourses.sorted(by: { (course1, course2) in
            let date = Date()
            if TimeManager.compareDates(date1: course1.endTime!, date2: date) {
                // Course is concluded
                return false
            } else {
                if TimeManager.compareDates(date1: course2.endTime!, date2: date) {
                    return true
                }
                // Course is awaiting or in progress
                if TimeManager.compareDates(date1: course1.startTime!, date2: course2.startTime!) {
                    return true
                }
                return false
            }
        })
        return sortedCourses
    }
}

struct CoursesScrollView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        CoursesScrollView()
            .environment(\.managedObjectContext, context)
            .previewLayout(.sizeThatFits)
    }
}
