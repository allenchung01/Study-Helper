//
//  CoursesView.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import SwiftUI

struct HomeView: View {
    var name: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            DashboardProfileView(name: name)
            CoursesViewTitle()
            CoursesScrollView()
                .padding(-30)
            Text("Upcoming Assignments")
                .font(.title)
                .bold()
            Text("Scheduled Events")
                .bold()
                .font(.title)
            Spacer()
        }
        .padding(30)
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
