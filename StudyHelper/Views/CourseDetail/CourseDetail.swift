//
//  CourseDetail.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/21/21.
//

import SwiftUI

struct CourseDetail: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    var course: Course
    
    @State private var isShowingAddAssignmentView = false
    @State private var numDays: NumDays = .allAssignments
    
    var body: some View {
        return ZStack {
            Color.mySecondaryBackground
                .ignoresSafeArea()
            
            if course.name != nil {
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    CourseDetailNavigationBar(course: course)
                    CourseDetailHeader(course: course)
                    /*VStack(alignment: .leading, spacing: 20) {
                        Text("Info")
                            .fontWeight(.semibold)
                            .font(.title2)
                        Text(TimeManager.timeFromDate(date: course.startTime!))
                        Text(TimeManager.timeFromDate(date: course.endTime!))
                    }*/
                    
                    VStack(alignment: .leading, spacing: 20) {
                        HStack(alignment: .center, spacing: 0) {
                            Text("Assignments")
                                .fontWeight(.semibold)
                                .font(.title2)
                            Spacer()
                            Button(action: handleAddAssignmentButton) {
                                Image(systemName: "plus")
                            }
                        }

                        AssignmentList(course: course, numDays: $numDays)
                        
                    }
                    
                    Text("Quizzes/ Tests")
                        .fontWeight(.semibold)
                        .font(.title2)
                    
                    Text("Links")
                        .fontWeight(.semibold)
                        .font(.title2)
                    
                    Spacer()
                }
                .padding(30)
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $isShowingAddAssignmentView) {
                AddAssignmentView(course: course, isPresented: $isShowingAddAssignmentView)
                    .environmentObject(appEnvironment)
            }
            }
        }
    }
    
    func handleAddAssignmentButton() {
        isShowingAddAssignmentView = true
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let course = Course(context: context)
        course.timestamp = Date()
        course.name = "CS 255"
        course.startTime = Date()
        course.endTime = Date()
        course.days = [false, true, false, true, false, true, false]
        course.systemImageName = "laptopcomputer"
        return CourseDetail(course: course)
    }
}
