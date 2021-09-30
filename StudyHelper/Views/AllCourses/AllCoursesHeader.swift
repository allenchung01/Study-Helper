//
//  AllCoursesHeader.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/18/21.
//

import SwiftUI

struct AllCoursesHeader: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var appEnvironment: AppEnvironment
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Course.name, ascending: true)],
        animation: .default)
    private var courses: FetchedResults<Course>
    
    @State private var isAddingCourse = false
    @State private var isChangingName = false
    
    private let vm = CourseDataViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("All Courses")
                    .fontWeight(.semibold)
                    .font(.title)
                Spacer()
                HStack(alignment: .center, spacing: 20) {
                    Button(action: handleAddCourseButton) {
                        Image(systemName: "plus")
                    }
                    Menu(content: {
                        Button(action: {
                            isChangingName = true
                        }) {
                            Text("Change Name")
                        }
                        Link("Privacy Policy", destination: URL(string: "https://studystackhelp.wordpress.com/privacy-policy/")!)
                        /*Button(action: {}) {
                            Text("Privacy Policy")
                        }*/
                        if #available(iOS 15.0, *) {
                            Button(role: .destructive, action: {
                                vm.deleteAllCourses(courses: Array(courses), viewContext: viewContext)
                            }) {
                                Text("Delete All Courses")
                            }
                        } else {
                            // Fallback on earlier versions
                            Button(action: {
                                vm.deleteAllCourses(courses: Array(courses), viewContext: viewContext)
                            }) {
                                Text("Delete All Course")
                            }
                        }
                    }, label: {
                        Image(systemName: "gear")
                            .foregroundColor(colorScheme == .light ? .black : .white)
                    })
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
        .sheet(isPresented: $isChangingName) {
            EnterNameScreen(isPresented: $isChangingName)
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
