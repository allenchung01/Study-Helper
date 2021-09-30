//
//  CoursesView.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var name: String
    
    @State private var numDays: NumDays = .oneWeek
    @State private var numDaysExam: NumDays = .allAssignments
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40) {
                DashboardProfileView(name: name)
                    //.padding(.bottom, 30)
                VStack(alignment: .leading, spacing: 20) {
                    CoursesViewTitle()
                        //.padding(.top, 15)
                    CoursesScrollView()
                        .padding(-30)
                }
                /*.background(
                    Color.myComplementaryColor
                        .padding(-30)
                )*/
                VStack(alignment: .leading, spacing: 20) {
                    DueSoonHeader(selectedNumDays: $numDays)
                        //.padding(.top, 15)
                    AssignmentList(numDays: $numDays)
                }
                VStack(alignment: .leading, spacing: 20) {
                    ExamsHeader(selectedNumDays: $numDaysExam)
                    /*Text("Exams/ Quizzes")
                        .fontWeight(.semibold)
                        .font(.title2)*/
                    ExamsList(numDays: $numDaysExam)
                }
                .padding(.bottom, 20)
                    //.padding(.top, 15)
                Spacer()
            }
            .padding(30)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let name = "Allen"
        ZStack {
            Color(.mySecondaryBackground)
                .ignoresSafeArea()
            HomeView(name: name)
                .environment(\.managedObjectContext, context)
        }
    }
}
