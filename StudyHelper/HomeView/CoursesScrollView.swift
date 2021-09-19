//
//  CoursesScrollView.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import SwiftUI

struct CoursesScrollView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Course.timestamp, ascending: true)],
        animation: .default)
    private var courses: FetchedResults<Course>
    
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
        let context = PersistenceController.preview.container.viewContext
        CoursesScrollView()
            .environment(\.managedObjectContext, context)
            .previewLayout(.sizeThatFits)
    }
}
