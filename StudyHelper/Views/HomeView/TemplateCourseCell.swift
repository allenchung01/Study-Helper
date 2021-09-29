//
//  TemplateCourseCell.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/29/21.
//

import SwiftUI

struct TemplateCourseCell: View {
    
    var name: String
    var systemImageName: String
    var startTime: String
    var endTime: String
    var progress: Progress
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 3) {
                VStack(alignment: .leading, spacing: 10) {
                    Image(systemName: systemImageName)
                        .font(.caption)
                        .frame(width: 40, height: 40)
                        .background(Color.myComplementaryColor)
                        .cornerRadius(10.0)
                    HStack(alignment: .center, spacing: 10) {
                        Text(name)
                            .fontWeight(.semibold)
                        switch progress {
                        case .awaitingStart:
                            CourseProgressTag(progress: .awaitingStart)
                        case .inProgress:
                            CourseProgressTag(progress: .inProgress)
                        case .concluded:
                            CourseProgressTag(progress: .concluded)
                        }
                    }
                }
                HStack(alignment: .center, spacing: 6) {
                    //Image(systemName: "clock")
                    Text("\(startTime) - \(endTime)")
                        .fontWeight(.light)
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
        }
        .padding(30)
        .background(Color.myPrimaryBackground)
        .cornerRadius(20.0)
        .background(
            Color.myTertiaryBackground
                .cornerRadius(20.0)
                .padding(10)
                .offset(x: 0, y: -20)
        )
        .shadow(color: .myShadow ,radius: 5, x: 0.0, y: 10.0)
        
    }
}

struct TemplateCourseCell_Previews: PreviewProvider {
    static var previews: some View {
        TemplateCourseCell(name: "CS 255", systemImageName: "laptop.computer", startTime: "1:00 PM", endTime: "1:50 PM", progress: .awaitingStart)
    }
}
