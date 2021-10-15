//
//  AllCoursesGrid.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/18/21.
//

import SwiftUI

struct AllCoursesGrid: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var appEnvironment: AppEnvironment
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Course.name, ascending: true)],
        animation: .default)
    private var courses: FetchedResults<Course>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Assignment.timestamp, ascending: true)],
        animation: .default)
    private var assignments: FetchedResults<Assignment>
    
    @State private var isAddingCourse = false
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                //Spacer()
                HStack(alignment: .center, spacing: 20) {
                    Image(systemName: "folder")
                        .font(.caption2)
                        .foregroundColor(.black)
                        .frame(width: 36, height: 36)
                        .background(Color.myComplementaryColor2)
                        .cornerRadius(10.0)
                    VStack(alignment: .leading, spacing: 3) {
                        Text("Courses")
                            .fontWeight(.light)
                            .foregroundColor(.secondary)
                        Text(String(courses.count))
                            .fontWeight(.semibold)
                            .font(.title3)
                    }
                }
                Spacer()
                HStack(alignment: .center, spacing: 20) {
                    Image(systemName: "paperclip")
                        .font(.caption2)
                        .foregroundColor(.black)
                        .frame(width: 36, height: 36)
                        .background(Color.myComplementaryColor3)
                        .cornerRadius(10.0)
                    VStack(alignment: .leading, spacing: 3) {
                        Text("Assignments")
                            .fontWeight(.light)
                            .foregroundColor(.secondary)
                        Text(String(assignments.count))
                            .fontWeight(.semibold)
                            .font(.title3)
                    }
                }
                //Spacer()
            }
            .padding(30)
            .background(Color.myTertiaryBackground)
            
            if courses.count != 0 {
                LazyVGrid(columns: columns, alignment: .center, spacing: 30) {
                    ForEach(courses, id: \Course.self) { course in
                        NavigationLink(destination: CourseDetail(course: course)) {
                            CourseGridCell(course: course)
                        }
                    }
                }
                .padding(30)
                .padding(.bottom, 70)
            } else {
                LazyVGrid(columns: columns, alignment: .center, spacing: 30) {
                    TemplateCourseGridCell(name: "CS141", systemImageName: "laptopcomputer", days: [false, true, false, true, false, true, false])
                    TemplateCourseGridCell(name: "CS150", systemImageName: "laptopcomputer", days: [false, false, true, false, true, false, false])
                    TemplateCourseGridCell(name: "MATH 210", systemImageName: "x.squareroot", days: [false, true, false, true, false, true, false])
                    TemplateCourseGridCell(name: "MUS 107", systemImageName: "music.note", days: [false, true, false, true, false, false, false])
                }
                .opacity(0.5)
                .blur(radius: 3.0)
                .overlay (
                    Button(action: {
                        isAddingCourse = true
                    }) {
                        ZStack {
                            /*RadialGradient(colors: [.myComplementaryColor.opacity(0.9), colorScheme == .light ? .white.opacity(0) : .black.opacity(0)], center: .center, startRadius: 0, endRadius: 200)*/
                            VStack(alignment: .center, spacing: 20) {
                                Image(systemName: "plus")
                                    //.font(.title2)
                                Text("Add Course")
                                    //.font(.title2)
                                    .fontWeight(.semibold)
                            }
                            .padding(30)
                            .background(Color.myPrimaryBackground.opacity(0.8))
                            .cornerRadius(20.0)
                            .shadow(color: .myShadow ,radius: 5, x: 0.0, y: 10.0)
                        }
                    }
                )
                .padding(30)
            }
        }
        .sheet(isPresented: $isAddingCourse) {
            AddCourseView(isPresented: $isAddingCourse)
                .environmentObject(appEnvironment)
                .environment(\.managedObjectContext, viewContext)
        }
        
    }
}

struct AllCoursesGrid_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        AllCoursesGrid()
            .environment(\.managedObjectContext, context)
            .previewLayout(.sizeThatFits)
    }
}
