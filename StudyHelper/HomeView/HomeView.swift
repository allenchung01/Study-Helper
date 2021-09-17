//
//  CoursesView.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import SwiftUI

struct HomeView: View {
    var courses: [String]
    var name: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            DashboardProfileView(name: name)
            CoursesViewTitle()
            CoursesScrollView(courses: courses)
                .padding(-30)
            Text("Upcoming Assignments")
                .bold()
                .font(.title)
            Text("Scheduled Events")
                .bold()
                .font(.title)
            Spacer()
        }
        .padding(30)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let courses = ["CS 211", "CS 250", "CS 377", "MATH 210"]
        let name = "Allen"
        ZStack {
            Color(.mySecondaryBackground)
                .ignoresSafeArea()
            HomeView(courses: courses, name: name)
        }
    }
}
