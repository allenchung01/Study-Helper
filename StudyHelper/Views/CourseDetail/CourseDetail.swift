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
    
    var body: some View {
        return ZStack {
            Color.mySecondaryBackground
                .ignoresSafeArea()
            
            if course.name != nil {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    CourseDetailNavigationBar(course: course)
                    CourseDetailHeader(course: course)
                    
                    Text("Info")
                        .bold()
                        .font(.title2)
                    Text(TimeManager.timeFromDate(date: course.startTime!))
                    Text(TimeManager.timeFromDate(date: course.endTime!))
                    
                    HStack {
                        course.days![0] == true ? Text("Sun") : nil
                        course.days![1] == true ? Text("Mon") : nil
                        course.days![2] == true ? Text("Tue") : nil
                        course.days![3] == true ? Text("Wed") : nil
                        course.days![4] == true ? Text("Thu") : nil
                        course.days![5] == true ? Text("Fri") : nil
                        course.days![6] == true ? Text("Sat") : nil
                    }
                    
                    Group {
                        HStack(alignment: .center, spacing: 0) {
                            Text("Assignments")
                                .bold()
                                .font(.title2)
                            Spacer()
                            Button(action: handleAddAssignmentButton) {
                                Image(systemName: "plus")
                            }
                        }
                        if course.assignments?.count != 0 {
                            AssignmentList(course: course)
                        }
                    }
                    
                    Text("Quizzes/ Tests")
                        .bold()
                        .font(.title2)
                    
                    Text("Links")
                        .bold()
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
        return CourseDetail(course: course)
    }
}
