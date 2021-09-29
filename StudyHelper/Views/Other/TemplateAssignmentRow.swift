//
//  TemplateAssignmentRow.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/29/21.
//

import SwiftUI

struct TemplateAssignmentRow: View {
    
    var name: String
    var course: String
    var dueDate: String
    var isCompleted: Bool
    var systemImageName: String
    
    var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading, spacing: 3) {
                    
                    HStack(alignment: .center, spacing: 10) {
                        Text(course)
                            .font(.subheadline)
                    }
                    .foregroundColor(.secondary)
                    HStack(spacing: 10) {
                        Text(name)
                            .fontWeight(.semibold)
                            .if(isCompleted, transform: {
                                $0.strikethrough()
                            })
                                CheckBox(selected: isCompleted, onToggle: {})
                    }
                    Text(dueDate)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .fontWeight(.light)
                    
                }
                Spacer()
            }
            .padding(30)
            .background(Color.myPrimaryBackground)
            .cornerRadius(20.0)
            .shadow(color: .myShadow ,radius: 5, x: 0.0, y: 10.0)
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: systemImageName)
                        .font(.caption2)
                        .frame(width: 36, height: 36)
                    //.padding(0)
                        .background(Color.myComplementaryColor)
                        .cornerRadius(10.0)
                        .padding(30)
                }
            }
        }
    }
            
            
}

struct TemplateAssignmentRow_Previews: PreviewProvider {
    static var previews: some View {
        TemplateAssignmentRow(name: "Homework 1", course: "CS 141", dueDate: "Wednesday, Sep 29, 12:00 AM", isCompleted: false, systemImageName: "laptopcomputer")
    }
}
