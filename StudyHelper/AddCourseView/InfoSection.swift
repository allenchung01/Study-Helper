//
//  InfoSection.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/19/21.
//

import SwiftUI

struct InfoSection<Content: View>: View {
    var title: String
    @ViewBuilder var content: Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(title)
                .font(.title3)
                .bold()
            content
        }
        .padding(30)
        .background(Color.myPrimaryBackground)
        .cornerRadius(20.0)
        .shadow(color: .myShadow ,radius: 10, x: 0.0, y: 5.0)
    }
}

struct InfoSection_Previews: PreviewProvider {
    static var previews: some View {
        InfoSection(title: "Log In") {
            InfoField(text: .constant(""), fieldName: "Username", placeholder: "John", systemImageName: "person")
            InfoField(text: .constant(""), fieldName: "Password", placeholder: "", systemImageName: "lock")
        }
        .padding(30)
        .background(Color.mySecondaryBackground)
        .previewLayout(.sizeThatFits)
    }
}
