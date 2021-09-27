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
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                DashboardProfileView(name: name)
                CoursesViewTitle()
                    .padding(.top, 15)
                CoursesScrollView()
                    .padding(-30)
                DueSoonHeader()
                    .padding(.top, 15)
                AssignmentList()
                Text("Exams")
                    .bold()
                    .font(.title)
                    .padding(.top, 15)
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
