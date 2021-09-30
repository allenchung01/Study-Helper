//
//  CallToActionButton.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/19/21.
//

import SwiftUI

struct CallToActionButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            Button(action: action) {
                Text(text)
                    .fontWeight(.semibold)
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.9))
                    .foregroundColor(.white)
                    .cornerRadius(20.0)
                    .shadow(color: .myShadow ,radius: 10, x: 0.0, y: 5.0)
                    .padding(.horizontal, 30)
            }
        }
    }
}

struct CallToActionButton_Previews: PreviewProvider {
    static var previews: some View {
        CallToActionButton(text: "Add Course", action: {})
    }
}
