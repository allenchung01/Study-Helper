//
//  IconSelector.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/23/21.
//

import SwiftUI

struct IconSelector: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedImage: String
    
    private let systemImageNames = [
        "",
        "laptopcomputer", // Computers
        "x.squareroot", // Math
        "testtube.2", // Science
        "book.closed", // Reading
        "map", //Geography
        "globe.americas", // Nature/ archeology
        "paintbrush.pointed", // Art
        "pencil", // Writing
        "music.note", // Music
        "suitcase", // Business
        "stethoscope", // Nursing/ Medical
        "allergens", // Biology
        "creditcard", // Finance
        "person.wave.2", // Language
        "brain", // Phsycology
        "theatermasks", // Visual / Performing
        "leaf", // Nature
        "newspaper", // Politics
        "scalemass", // Sports / Fitness
        "briefcase", // Lawyer
        "camera", // Photography
        "building", // Architecture
        "wrench", // Mechanic
        "fork.knife", // Cook
        "circle",
        "square",
        "triangle",
        "diamond",
        "pentagon"
        
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Select an Image")
                .font(.caption)
                .foregroundColor(.secondary)
                .fontWeight(.light)
            ScrollView(.horizontal) {
                HStack(alignment: .center, spacing: 20) {
                    ForEach(systemImageNames, id: \.self) { name in
                        Button(action: {selectImage(name: name)}) {
                            Image(systemName: name)
                                .frame(width: 40, height: 40)
                                .background(selectedImage == name ? .myComplementaryColor : Color.myTertiaryBackground)
                                .cornerRadius(10.0)
                                .foregroundColor(selectedImage == name ? .black : .secondary)
                                .font(.caption)
                        }
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
