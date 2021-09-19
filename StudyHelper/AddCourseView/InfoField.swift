//
//  InfoField.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/19/21.
//

import SwiftUI

struct InfoField: View {
    @Binding var text: String
    var fieldName: String
    var placeholder: String
    var systemImageName: String?
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            if systemImageName != nil {
                Image(systemName: systemImageName!)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            VStack(alignment: .leading, spacing: 3) {
                Text(fieldName)
                    .bold()
                    .font(.caption)
                    .foregroundColor(.secondary)
                TextField(placeholder, text: $text)
            }
        }
        .padding(20)
        .background(Color.mySecondaryBackground)
        .cornerRadius(10.0)
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
