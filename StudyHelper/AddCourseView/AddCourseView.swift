//
//  AddCourseView.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/19/21.
//

import SwiftUI

struct AddCourseView: View {
    
    @State private var courseName = ""
    @State private var startTime = Calendar.current.startOfDay(for: Date())
    @State private var endTime = Calendar.current.startOfDay(for: Date())
    
    var body: some View {
        ZStack {
            Color.mySecondaryBackground
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 30) {
                AddCourseHeader()
                Divider()
                InfoSection(title: "Course Info") {
                    InfoField(text: $courseName, fieldName: "Course Name", placeholder: "e.g. CS 255", systemImageName: "folder")
                }
                InfoSection(title: "Time Slot") {
                    TimeSelector(time: $startTime, fieldName: "Start Time", systemImageName: "clock")
                    TimeSelector(time: $endTime, fieldName: "End Time", systemImageName: "clock")
                }
                Spacer()
            }
            .padding(30)
        }
    }
}

struct AddCourseView_Previews: PreviewProvider {
    static var previews: some View {
        AddCourseView()
    }
}
