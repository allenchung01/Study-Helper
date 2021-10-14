//
//  AllCoursesView.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/18/21.
//

import SwiftUI

struct AllCoursesView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
            ZStack {
                Color.mySecondaryBackground
                    .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 0) {
                    AllCoursesHeader()
                        .padding(.top, 40)
                        .padding(.horizontal, 30)
                    //Divider()
                    ScrollView(.vertical) {
                        AllCoursesGrid()
                    }
                    //.padding(-30)
                }
                .frame(maxHeight: .infinity)
                //.padding([.horizontal, .top], 30)
                .navigationBarHidden(true)
                //.ignoresSafeArea()
                            //.fill(Color.myButtonColor.opacity(0.2))
                
            }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }//.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AllCoursesView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        ZStack {
            Color(.mySecondaryBackground)
                .ignoresSafeArea()
            AllCoursesView()
                .accentColor(.black)
                .environment(\.managedObjectContext, context)
        }
    }
}
