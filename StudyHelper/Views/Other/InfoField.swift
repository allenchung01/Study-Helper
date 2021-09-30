//
//  InfoField.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/19/21.
//

import SwiftUI

struct InfoField: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var text: String
    var fieldName: String
    var placeholder: String
    var systemImageName: String?
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                Text(fieldName)
                    .fontWeight(.light)
                    .font(.caption)
                    .foregroundColor(.secondary)
                TextField(placeholder, text: $text)
                    .font(Font.body.weight(.semibold))
            }
            if systemImageName != nil {
                Image(systemName: systemImageName!)
                    .frame(width: 40, height: 40)
                    .font(.caption)
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .background(colorScheme == .light ? Color.myPrimaryBackground : Color.myTertiaryBackground)
                    .cornerRadius(10.0)
                    .shadow(color: .myShadow ,radius: 5, x: 0.0, y: 10.0)
            }
        }
        /*.padding(20)
        .background(Color.myTertiaryBackground)
        .cornerRadius(10.0)*/
    }
}

struct InfoField_Previews: PreviewProvider {
    static var previews: some View {
        let fieldName = "Course Name"
        let placeholder = "e.g. CS255"
        InfoField(text: .constant(""), fieldName: fieldName, placeholder: placeholder, systemImageName: "folder")
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
