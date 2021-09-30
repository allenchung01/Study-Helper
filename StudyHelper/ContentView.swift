//
//  ContentView.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.managedObjectContext) private var viewContext
    
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    @State private var isDisplayingOnboardScreen = false

    let gradient = Gradient(colors: [.orange, .white.opacity(0)])
    
    var body: some View {
        ZStack {
            /*TabView {
                ZStack {
                    Color(.mySecondaryBackground)
                        .ignoresSafeArea()
                    HomeView(name: "Allen")
                }
                .tabItem {
                    Image(systemName: "house.fill")
                }
                ZStack {
                    Color(.mySecondaryBackground)
                        .ignoresSafeArea()
                    AllCoursesView()
                }
                .tabItem {
                    Image(systemName: "folder.fill")
                }
            }
            .accentColor(.black)
             */
            CustomTabBar()
                .accentColor(colorScheme == .light ? .black : .white)
            
            if appEnvironment.isDisplayingAddCourseSuccessBanner {
                //Banner(text: "Course Added!", color: .systemBlue)
                Banner(text: "Course Added:", color: .myComplementaryColor2, subText: appEnvironment.subText,  systemImageName: "folder")
            }
            if appEnvironment.isDisplayingAddAssignmentSuccessBanner {
                //Banner(text: "Assignment Added!", color: .systemBlue)
                Banner(text: "Assignment Added:", color: .myComplementaryColor3, subText: appEnvironment.subText,  systemImageName: "paperclip")
            }
            if appEnvironment.isDisplayingAddExamSuccessBanner {
                //Banner(text: "Assignment Added!", color: .systemBlue)
                Banner(text: "Exam Added:", color: .myComplementaryColor4, subText: appEnvironment.subText,  systemImageName: "hourglass")
            }
        }
        .onAppear {
            if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
                isDisplayingOnboardScreen = true
                //UserDefaults.standard.set("Allen", forKey: "name")
            }
        }
        .sheet(isPresented: $isDisplayingOnboardScreen) {
            EnterNameScreen(isPresented: $isDisplayingOnboardScreen)
        }

    }

    /*private func addItem() {
        withAnimation {
            let newItem = Course(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { courses[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }*/
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
