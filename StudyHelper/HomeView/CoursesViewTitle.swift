//
//  CoursesViewTitle.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import SwiftUI

struct CoursesViewTitle: View {
    var date: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("Today's Courses")
                    .bold()
                    .font(.title)
                Text(date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

struct CoursesViewTitle_Previews: PreviewProvider {
    static var previews: some View {
        let date = "Friday, September 17, 2021"
        CoursesViewTitle(date: date)
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
