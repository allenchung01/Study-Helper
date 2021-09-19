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
                    .font(.title)
                Text("New Course")
                    .bold()
                    .font(.title)
            }
            Spacer()
        }
    }
}

struct AddCourseHeader_Previews: PreviewProvider {
    static var previews: some View {
        AddCourseHeader()
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
