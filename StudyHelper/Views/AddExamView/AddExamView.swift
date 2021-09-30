//
//  AddExamView.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/30/21.
//

import SwiftUI

struct AddExamView: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    var course: Course
    
    @Binding var isPresented: Bool
    
    @State private var examName = ""
    @State private var date = TimeManager.startOfDay()
    
    private let examService = ExamService()
    
    var body: some View {
        ZStack {
            Color.mySecondaryBackground
                .ignoresSafeArea()
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 30) {
                    AddExamHeader()
                    Divider()
                    InfoSection(title: "Exam Info") {
                        InfoField(text: $examName, fieldName: "Exam Name", placeholder: "e.g. Midterm 1", systemImageName: "hourglass")
                    }
                    InfoSection(title: "Dates") {
                        TimeSelector(time: $date, fieldName: "Exam Date", systemImageName: "calendar", isFullDate: true)
                    }
                    Spacer()
                }
                .padding(30)
            }
            CallToActionButton(text: "Add Exam") {
                if examService.createExam(name: examName, date: date, course: course, viewContext: viewContext) {
                    appEnvironment.displayBanner(bannerType: .addExamSuccess, subText: examName)
                    //presentationMode.wrappedValue.dismiss()
                    isPresented = false
                } else {
                    appEnvironment.displayBanner(bannerType: .addExamError, subText: "Please complete all fields.")
                }
            }
            if appEnvironment.isDisplayingAddExamErrorBanner {
                Banner(text: "Error:", color: .myErrorRed, subText: "Please complete all fields.", systemImageName: "exclamationmark.circle.fill")
            }
        }
    }
}

struct AddExamView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        let course = Course(context: viewContext)
        AddExamView(course: course, isPresented: .constant(true))
            .environment(\.managedObjectContext, viewContext)
            .environmentObject(AppEnvironment())
    }
}
