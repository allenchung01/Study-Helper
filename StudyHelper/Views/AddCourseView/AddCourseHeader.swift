//
//  AddCourseHeader.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/19/21.
//

import SwiftUI

struct AddCourseHeader: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading) {
                Text("Add a")
                    .fontWeight(.light)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("New Course")
                    .font(.title)
                    .fontWeight(.semibold)
            }
            Spacer()
            Image(systemName: "folder")
                .foregroundColor(.black)
                .font(.caption)
                .frame(width: 40, height: 40)
                .background(Color.myComplementaryColor2)
                .cornerRadius(10.0)
                .shadow(color: .myShadow ,radius: 5, x: 0.0, y: 10.0)
        }
        .padding(.top, 10)
    }
}

struct AddCourseHeader_Previews: PreviewProvider {
    static var previews: some View {
        AddCourseHeader()
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
