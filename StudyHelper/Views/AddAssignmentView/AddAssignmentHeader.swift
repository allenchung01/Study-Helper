//
//  AddAssignmentHeader.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/22/21.
//

import SwiftUI

struct AddAssignmentHeader: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading) {
                Text("Add a")
                    .fontWeight(.light)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("New Assignment")
                    .fontWeight(.semibold)
                    .font(.title)
            }
            Spacer()
            Image(systemName: "paperclip")
                .foregroundColor(.black)
                .frame(width: 40, height: 40)
                .background(Color.myComplementaryColor3)
                .font(.caption)
                .cornerRadius(10.0)
                .shadow(color: .myShadow ,radius: 5, x: 0.0, y: 10.0)
        }
        .padding(.top, 10)
    }
}

struct AddAssignmentHeader_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentHeader()
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
