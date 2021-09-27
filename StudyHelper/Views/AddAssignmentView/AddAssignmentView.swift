//
//  AddAssignmentView.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/22/21.
//

import SwiftUI

struct AddAssignmentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    var course: Course
    
    @Binding var isPresented: Bool
    
    @State private var assignmentName = ""
    @State private var dueDate = TimeManager.startOfDay()
    
    private let assignmentsService = AssignmentsService()
    
    var body: some View {
        ZStack {
            Color.mySecondaryBackground
                .ignoresSafeArea()
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 30) {
                    AddAssignmentHeader()
                    Divider()
                    InfoSection(title: "Assignment Info") {
                        InfoField(text: $assignmentName, fieldName: "Assignment Name", placeholder: "e.g. Homework 1", systemImageName: "paperclip.circle")
                    }
                    InfoSection(title: "Deadline") {
                        TimeSelector(time: $dueDate, fieldName: "Due Date", systemImageName: "calendar", isFullDate: true)
                    }
                    Spacer()
                }
                .padding(30)
            }
            CallToActionButton(text: "Add Assignment") {
                if assignmentsService.createAssignment(name: assignmentName, dueDate: dueDate, course: course, viewContext: viewContext) {
                    appEnvironment.displayBanner(bannerType: .addAssignmentSuccess, subText: assignmentName)
                    //presentationMode.wrappedValue.dismiss()
                    isPresented = false
                } else {
                    appEnvironment.displayBanner(bannerType: .addAssignmentError, subText: "Please complete all fields.")
                }
            }
            if appEnvironment.isDisplayingAddAssignmentErrorBanner {
                Banner(text: "Error:", color: UIColor.systemRed, subText: "Please complete all fields.", systemImageName: "exclamationmark.circle.fill")
            }
        }
    }
}

struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        let course = Course(context: viewContext)
        AddAssignmentView(course: course, isPresented: .constant(true))
    }
}
