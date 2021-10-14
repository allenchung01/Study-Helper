//
//  CourseDetail.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/21/21.
//

import SwiftUI

struct CourseDetail: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    var course: Course
    
    @State private var isShowingAddAssignmentView = false
    @State private var isShowingAddExamView = false
    @State private var numDays: NumDays = .allAssignments
    
    var body: some View {
        return ZStack {
            Color.mySecondaryBackground
                .ignoresSafeArea()
            
            if course.name != nil {
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    CourseDetailNavigationBar(course: course)
                        .background(
                            Color.myTertiaryBackground
                                .padding(-30)
                                .padding(.top, -50)
                                .ignoresSafeArea()
                        )
                    CourseDetailHeader(course: course)
                        .background(
                            Color.myTertiaryBackground
                                .cornerRadius(40.0, corners: [.bottomRight])
                                .padding(-30)
                                
                        )
                        .padding(.bottom, 30)
                        .padding(.top, 10)
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
                    
                    VStack(alignment: .leading, spacing: 20) {
                        HStack(alignment: .center, spacing: 0) {
                            Text("Exams/ Quizzes")
                                .fontWeight(.semibold)
                                .font(.title2)
                            Spacer()
                            Button(action: handleAddExamButton) {
                                Image(systemName: "plus")
                            }
                        }
                        ExamsList(course: course, numDays: $numDays)
                    }
                    .padding(.bottom, 20)
                    
                    Spacer()
                }
                .padding(30)
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $isShowingAddAssignmentView) {
                AddAssignmentView(course: course, isPresented: $isShowingAddAssignmentView)
                    .environmentObject(appEnvironment)
            }
            .sheet(isPresented: $isShowingAddExamView) {
                AddExamView(course: course, isPresented: $isShowingAddExamView)
                    .environmentObject(appEnvironment)
            }
            }
        }
    }
    
    func handleAddAssignmentButton() {
        isShowingAddAssignmentView = true
    }
    
    func handleAddExamButton() {
        isShowingAddExamView = true
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
