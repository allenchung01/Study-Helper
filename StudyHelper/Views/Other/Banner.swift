//
//  Banner.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/21/21.
//

import SwiftUI

struct Banner: View {
    var text: String
    var color: UIColor
    var subText: String?
    var systemImageName: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading, spacing: 3) {
                    Text(text)
                        .bold()
                    if subText != nil {
                        Text(subText!)
                            .font(.subheadline)
                    }
                }
                Spacer()
                if systemImageName != nil {
                    Image(systemName: systemImageName!)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(30)
            .background(Color(color).opacity(0.9))
            .foregroundColor(.white)
            .cornerRadius(20.0)
            .padding(30)
            .shadow(color: .myShadow ,radius: 10, x: 0.0, y: 5.0)
            Spacer()
        }
        .zIndex(1.0)
        .transition(.scale(scale: 0, anchor: .top).animation(.spring()))
        //.transition(.scale.animation(.spring()).combined(with: .opacity.animation(.spring())))
    }
}

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Banner(text: "Course Added:", color: UIColor.systemBlue, subText: "CS255",  systemImageName: "rectangle.fill.badge.checkmark")
    }
}
