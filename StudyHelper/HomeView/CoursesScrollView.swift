//
//  CoursesScrollView.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import SwiftUI

struct CoursesScrollView: View {
    var courses: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(courses, id: \.self) { course in
                    CourseCell(course: course)
                }
            }
            .padding(30)
        }
    }
}

struct CoursesScrollView_Previews: PreviewProvider {
    static var previews: some View {
        let courses = ["CS 211", "CS 250"]
        CoursesScrollView(courses: courses)
            .previewLayout(.sizeThatFits)
    }
}
