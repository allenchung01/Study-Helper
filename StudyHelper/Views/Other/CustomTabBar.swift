//
//  CustomTabBar.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/27/21.
//

import SwiftUI

enum Tab {
    case home
    case allCourses
    case profile
}

struct CustomTabBar: View {
    
    @State var currentTab: Tab = .home
    
    var body: some View {
        ZStack {
            Color(.mySecondaryBackground)
                .ignoresSafeArea()
            switch currentTab {
            case .home:
                HomeView(name: "Allen")
            case .allCourses:
                AllCoursesView()
            case .profile:
                Text("Hello World")
            }
            tabBar
        }
    }
    
    var tabBar: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
            Rectangle()
                .fill(Color.myTertiaryBackground)
                .frame(height: 1)
            HStack(alignment: .center, spacing: 0) {
                Spacer()
                Button(action: {currentTab = .home} ) {
                    VStack(alignment: .center, spacing: 20) {
                        Image(systemName: "house")
                            .foregroundColor(.black)
                        Circle()
                            .fill(currentTab == .home ? .black : .mySecondaryBackground)
                            .frame(width: 6, height: 6)
                    }
                }
                Spacer()
                Button(action: {currentTab = .allCourses} ) {
                    VStack(alignment: .center, spacing: 20) {
                        Image(systemName: "folder")
                            .foregroundColor(.black)
                        Circle()
                            .fill(currentTab == .allCourses ? .black : .mySecondaryBackground)
                            .frame(width: 6, height: 6)
                    }
                }
                /*Spacer()
                Button(action: {currentTab = .profile} ) {
                    VStack(alignment: .center, spacing: 20) {
                        Image(systemName: "person")
                            .foregroundColor(.black)
                        Circle()
                            .fill(currentTab == .profile ? .black : .mySecondaryBackground)
                            .frame(width: 6, height: 6)
                    }
                }*/
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(30)
            .background(Color.mySecondaryBackground)
        }
        .ignoresSafeArea()
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.mySecondaryBackground
                .ignoresSafeArea()
            CustomTabBar()
        }
    }
}
