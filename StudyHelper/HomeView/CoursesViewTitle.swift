//
//  CoursesViewTitle.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import SwiftUI

// Dynamic title that includes the current date and updates
// the icon based on the current time.
struct CoursesViewTitle: View {
    let timeManager = TimeManager()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                HStack {
                    Text("Today's Courses")
                        .bold()
                    switch timeManager.timeOfDay {
                    case .morning:
                        Image(systemName: "sun.min.fill")
                    case .noon:
                        Image(systemName: "sun.max.fill")
                    case .night:
                        Image(systemName: "moon.stars.fill")
                    }
                }
                .font(.title)
                Text(timeManager.fullDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

struct CoursesViewTitle_Previews: PreviewProvider {
    static var previews: some View {
        CoursesViewTitle()
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
