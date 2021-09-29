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
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("All Courses")
                    .fontWeight(.semibold)
                    .font(.title)
                Spacer()
                Button(action: handleAddCourseButton) {
                    Image(systemName: "plus")
                }
            }
            .padding(.bottom, 20)
            Rectangle()
                .fill(Color.myTertiaryBackground)
                .frame(height: 1)
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
