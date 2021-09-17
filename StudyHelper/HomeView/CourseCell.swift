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
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 3) {
                Text(course)
                    .bold()
                HStack(alignment: .center, spacing: 6) {
                    Image(systemName: "clock")
                    Text("1:00 pm - 1:45 pm")
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
            Text("Awaiting Start") // In Progress(green) // Concluded(red)
                .font(.caption)
                .foregroundColor(.blue)
                .padding(.vertical, 5)
                .padding(.horizontal, 8)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(5.0)
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
            .background(Color.mySecondaryBackground)
            .previewLayout(.sizeThatFits)
    }
}
