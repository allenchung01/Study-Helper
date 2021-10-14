//
//  EnterNameScreen.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/30/21.
//

import SwiftUI

struct EnterNameScreen: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var isPresented: Bool
    
    @State var name: String = ""
    
    var body: some View {
        ZStack {
            Color.mySecondaryBackground
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 40) {
                
                Image(uiImage: UIImage(named: "StudyStackIcon.jpg")!)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(20.0)
                Text("Study Stack")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                InfoSection(title: "Enter your name.") {
                    InfoField(text: $name, fieldName: "Name", placeholder: "e.g. John", systemImageName: "person")
                }
            }
            .padding(30)
            CallToActionButton(text: "Continue") {
                if !name.isEmpty {
                    UserDefaults.standard.set(true, forKey: "didLaunchBefore")
                    UserDefaults.standard.set(name, forKey: "name")
                    isPresented = false
                }
            }
        }
    }
}

struct EnterNameScreen_Previews: PreviewProvider {
    static var previews: some View {
        EnterNameScreen(isPresented: .constant(true))
    }
}
