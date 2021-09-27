//
//  IconSelector.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/23/21.
//

import SwiftUI

struct IconSelector: View {
    @Binding var selectedImage: String
    
    private let systemImageNames = [
        "",
        "laptopcomputer", // Computers
        "x.squareroot", // Math
        "paintbrush.pointed", // Art
        "pencil", // Writing
        "music.note" // Music
        // Business
        // Language
        // Science
        // Nature
        // Politics
        // Finance
        // Law
        // Sports / Fitness
        // Phsycology
        // Nursing/ Medical
        // Lawyer
        // Cook
        // Nature/ archeology
        // Teaching / Education
        // History
        // Religion
        // Architecture
        // Agriculture
        // Culture / Ethinc / Gender
        // Biology
        // Marketing
        // Mechanic
        // Recreation / Parks
        // Physics
        // Visual / Performing Arts
        // Construction
        // Transportation
        // Reading
        
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(systemImageNames, id: \.self) { name in
                    Button(action: {selectImage(name: name)}) {
                        Image(systemName: name)
                            .frame(width: 50, height: 50)
                            .background(selectedImage == name ? .myButtonColor : Color.myTertiaryBackground)
                            .cornerRadius(10.0)
                            .foregroundColor(selectedImage == name ? .white : .secondary)
                    }
                }
            }
        }
        /*.padding(20)
        .background(Color.myPrimaryBackground)
        .cornerRadius(20.0)*/
    }
    
    private func selectImage(name: String) {
        selectedImage = name
    }
}

struct IconSelector_Previews: PreviewProvider {
    static var previews: some View {
        IconSelector(selectedImage: .constant(""))
            .padding(30)
            .background(Color.mySecondaryBackground)
            .previewLayout(.sizeThatFits)
    }
}
