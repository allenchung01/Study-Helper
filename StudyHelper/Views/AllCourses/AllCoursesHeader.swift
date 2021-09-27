//
//  AllCoursesHeader.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/18/21.
//

import SwiftUI

struct AllCoursesHeader: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    @Environment(\.managedObjectContext) var viewContext
    
    @State private var isAddingCourse = false
    
    var body: some View {
        HStack {
            Text("All Courses")
                .bold()
                .font(.title)
            Spacer()
            Button(action: handleAddCourseButton) {
                Image(systemName: "folder.fill.badge.plus")
            }
        }
        .sheet(isPresented: $isAddingCourse) {
            AddCourseView(isPresented: $isAddingCourse)
                .environmentObject(appEnvironment)
                .environment(\.managedObjectContext, viewContext)
        }
    }
    
    private func handleAddCourseButton() {
        isAddingCourse = true
    }
}

struct AllCoursesHeader_Previews: PreviewProvider {
    static var previews: some View {
        AllCoursesHeader()
            .padding(30)
            .accentColor(.black)
            .previewLayout(.sizeThatFits)
    }
}
