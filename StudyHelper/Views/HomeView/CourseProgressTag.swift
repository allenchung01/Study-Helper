//
//  CourseProgressTag.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/26/21.
//

import SwiftUI

enum Progress {
    case awaitingStart
    case inProgress
    case concluded
}

struct CourseProgressTag: View {
    var progress: Progress
    
    var body: some View {
        switch progress {
        case .awaitingStart:
            return Text("Awaiting Start")
                .bold()
                .font(.caption)
                .foregroundColor(.myButtonColor)
                .padding(.vertical, 7)
                .padding(.horizontal, 12)
                .background(Color.myButtonColor.opacity(0.1))
                .cornerRadius(10.0)
        case .inProgress:
            return Text("In Progress")
                .bold()
                .font(.caption)
                .foregroundColor(Color(UIColor.systemGreen))
                .padding(.vertical, 7)
                .padding(.horizontal, 12)
                .background(Color(UIColor.systemGreen).opacity(0.1))
                .cornerRadius(10.0)
        case .concluded:
            return Text("Concluded")
                .bold()
                .font(.caption)
                .foregroundColor(Color(UIColor.systemRed))
                .padding(.vertical, 7)
                .padding(.horizontal, 12)
                .background(Color(UIColor.systemRed).opacity(0.1))
                .cornerRadius(10.0)
        }
    }
}

struct CourseProgressTag_Previews: PreviewProvider {
    static var previews: some View {
        CourseProgressTag(progress: .inProgress)
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
