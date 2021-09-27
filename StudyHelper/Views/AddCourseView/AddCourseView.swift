//
//  AddCourseView.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/19/21.
//

import SwiftUI

struct AddCourseView: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    @ObservedObject private var vm = AddCourseViewModel()
    
    @Binding var isPresented: Bool
    
    @State private var displayErrorBanner = false
    
    @State private var courseName = ""
    @State private var startTime = Calendar.current.startOfDay(for: Date())
    @State private var endTime = Calendar.current.startOfDay(for: Date())
    @State private var days: [Bool] = [false, false, false, false, false, false, false]
    @State private var selectedImage = ""
    
    var body: some View {
        ZStack {
            Color.mySecondaryBackground
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    AddCourseHeader()
                    Divider()
                    InfoSection(title: "Course Info") {
                        InfoField(text: $courseName, fieldName: "Course Name", placeholder: "e.g. CS 255", systemImageName: "folder")
                        IconSelector(selectedImage: $selectedImage)
                    }
                    InfoSection(title: "Time Slot") {
                        TimeSelector(time: $startTime, fieldName: "Start Time", systemImageName: "clock")
                        TimeSelector(time: $endTime, fieldName: "End Time", systemImageName: "clock")
                        WeekDaySelector(selectedDays: $days)
                    }
                    Spacer()
                }
                .padding(30)
            }
            CallToActionButton(text: "Add Course") {
                if vm.addCourse(name: courseName, startTime: startTime, endTime: endTime, days: days, selectedImageName: selectedImage, viewContext: viewContext) {
                    appEnvironment.displayBanner(bannerType: .addCourseSuccess, subText: courseName)
                    //presentationMode.wrappedValue.dismiss()
                    isPresented = false
                } else {
                    appEnvironment.displayBanner(bannerType: .addCourseError, subText: "Please complete all fields.")
                }
            }
            if appEnvironment.isDisplayingAddCourseErrorBanner {
                Banner(text: "Error", color: UIColor.systemRed, subText: "Please complete all fields.", systemImageName: "exclamationmark.circle.fill")
            }
        }
    }
}

struct AddCourseView_Previews: PreviewProvider {
    static var previews: some View {
        AddCourseView(isPresented: .constant(true))
            .environmentObject(AppEnvironment())
    }
}
