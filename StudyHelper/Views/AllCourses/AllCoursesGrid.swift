//
//  AllCoursesGrid.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/18/21.
//

import SwiftUI

struct AllCoursesGrid: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Course.timestamp, ascending: false)],
        animation: .default)
    private var courses: FetchedResults<Course>
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        return LazyVGrid(columns: columns, alignment: .center, spacing: 30) {
            ForEach(courses, id: \Course.self) { course in
                NavigationLink(destination: CourseDetail(course: course)) {
                    CourseGridCell(course: course)
                }
            }
        }
        .padding(30)
        /*ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(courses, id: \Course.timestamp) { course in
                    NavigationLink(destination: CourseDetail(course: course)) {
                        CourseCell(course: course)
                    }
                }
            }
            .padding(30)
        }*/
    }
}

struct AllCoursesGrid_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        AllCoursesGrid()
            .environment(\.managedObjectContext, context)
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
