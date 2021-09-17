//
//  CoursesView.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import SwiftUI

struct HomeView: View {
    var courses: [String]
    
    var body: some View {
        let date = dateFormatter.string(from: Date())
        
        VStack(alignment: .leading, spacing: 30) {
            CoursesViewTitle(date: date)
            CoursesScrollView(courses: courses)
                .padding(-30)
            Spacer()
        }
        .padding(30)
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        return formatter
    }()
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let courses = ["CS 211", "CS 250", "CS 377", "MATH 210"]
        ZStack {
            Color(.mySecondaryBackground)
                .ignoresSafeArea()
            HomeView(courses: courses)
        }
    }
}
