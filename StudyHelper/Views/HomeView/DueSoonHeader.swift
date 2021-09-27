//
//  DueSoonHeader.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/22/21.
//

import SwiftUI

struct DueSoonHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                Text("Due Soon")
                    .font(.title)
                    .bold()
                /*Text("Assignments due within the next week.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)*/
            }
            Spacer()
        }
    }
}

struct DueSoonHeader_Previews: PreviewProvider {
    static var previews: some View {
        DueSoonHeader()
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
