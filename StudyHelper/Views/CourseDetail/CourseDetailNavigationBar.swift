//
//  CourseDetailNavigationBar.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/21/21.
//

import SwiftUI

struct CourseDetailNavigationBar: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var viewContext
    
    var course: Course
    
    let vm = CourseDataViewModel()
    
    var body: some View {
        HStack {
            Button(action: dismissView) {
                Image(systemName: "arrow.left")
                    .foregroundColor(colorScheme == .light ? .black : .white)
            }
            Spacer()
            Menu(content: {
                Button(action: {}) {
                    Text("Edit Course")
                }
                if #available(iOS 15.0, *) {
                    Button(role: .destructive, action: { vm.deleteCourse(course: course, viewContext: viewContext)
                        dismissView()
                    }) {
                        Text("Delete Course")
                    }
                } else {
                    // Fallback on earlier versions
                    Button(action: {
                        vm.deleteCourse(course: course, viewContext: viewContext)
                        dismissView()
                    }) {
                        Text("Delete Course")
                    }
                }
            }, label: {
                Image(systemName: "gear")
                    .foregroundColor(colorScheme == .light ? .black : .white)
            })
        }
    }
    
    func dismissView() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct CourseDetailNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let course = Course(context: context)
        CourseDetailNavigationBar(course: course)
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
