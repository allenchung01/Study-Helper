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
                    .font(.title)
                Text("New Assignment")
                    .bold()
                    .font(.title)
            }
            Spacer()
            Image(systemName: "paperclip.circle.fill")
                .font(.title)
        }
    }
}

struct AddAssignmentHeader_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentHeader()
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
