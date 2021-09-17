//
//  CourseCell.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import SwiftUI

struct CourseCell: View {
    var course: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(course)
                .bold()
            Text("1:00 pm - 1:45 pm")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(30)
        .background(Color.myPrimaryBackground)
        .cornerRadius(10.0)
        .shadow(color: .myShadow ,radius: 10, x: 0.0, y: 5.0)
    }
}

struct CourseCell_Previews: PreviewProvider {
    static var previews: some View {
        let course = "CS 255"
        CourseCell(course: course)
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
