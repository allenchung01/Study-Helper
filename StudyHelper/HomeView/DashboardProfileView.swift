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
            HStack(alignment: .bottom) {
                Text("Hey, \(name)")
                    .bold()
                    .font(.title3)
                Spacer()
                Circle()
                    .fill(Color.myPrimaryBackground)
                    .frame(width: 30, height: 30)
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
