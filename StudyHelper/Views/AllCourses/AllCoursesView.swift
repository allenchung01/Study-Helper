//
//  AllCoursesView.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/18/21.
//

import SwiftUI

struct AllCoursesView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.mySecondaryBackground
                    .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 30) {
                    AllCoursesHeader()
                    //Divider()
                    ScrollView(.vertical) {
                        AllCoursesGrid()
                    }
                    .padding(-30)
                }
                .frame(maxHeight: .infinity)
                .padding([.horizontal, .top], 30)
                .navigationBarHidden(true)
                //.ignoresSafeArea()
                            //.fill(Color.myButtonColor.opacity(0.2))
                
            }
        }
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
