//
//  DashboardProfileView.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import SwiftUI

struct DashboardProfileView: View {
    var name: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack(alignment: .center) {
                HStack {
                    switch TimeManager.timeOfDay {
                    case .morning:
                        Text("Good morning,")
                            .bold()
                            .fontWeight(.light)
                    case .noon:
                        Text("Good afternoon,")
                            .bold()
                            .fontWeight(.light)
                    case .night:
                        Text("Good evening,")
                            .bold()
                            .fontWeight(.light)
                    }
                        //.fontWeight(.light)
                    Text(name)
                        .bold()
                    switch TimeManager.timeOfDay {
                    case .morning:
                        Image(systemName: "sun.min.fill")
                            .font(.title3)
                    case .noon:
                        Image(systemName: "sun.max.fill")
                            .font(.title3)
                    case .night:
                        Image(systemName: "moon.stars.fill")
                            .font(.title3)
                    }
                }
                .font(.title3)
                Spacer()
                /*Circle()
                    .fill(Color.myPrimaryBackground)
                    .frame(width: 30, height: 30)*/
            }
            Divider()
        }
    }
}

struct DashboardProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let name = "Allen"
        DashboardProfileView(name: name)
            .padding(30)
            .background(Color.mySecondaryBackground)
            .previewLayout(.sizeThatFits)
    }
}
