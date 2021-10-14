//
//  StudyHelperApp.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import SwiftUI

@main
struct StudyHelperApp: App {
    let persistenceController = PersistenceController.shared
    //let persistenceController = PersistenceController.preview
    
    let appEnvironment = AppEnvironment()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(appEnvironment)
        }
    }
}
