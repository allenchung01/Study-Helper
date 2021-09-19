//
//  AllCoursesGrid.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/18/21.
//

import SwiftUI

struct AllCoursesGrid: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Course.timestamp, ascending: true)],
        animation: .default)
    private var courses: FetchedResults<Course>
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(courses, id: \Course.timestamp) { course in
                CourseCell(course: course)
            }
        }
        //.frame(height: 100)
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
