//
//  ToggleButton.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/21/21.
//

import SwiftUI

struct ToggleButton: View {
    var text: String
    var onToggle: () -> Void
    
    @State var selected = false
    
    var body: some View {
        Button(action: toggleButton) {
            Text(text)
                .font(.caption)
                .frame(width: 40, height: 40)
                .background(selected ? Color.myComplementaryColor : Color.myTertiaryBackground)
                .cornerRadius(10.0)
                .foregroundColor(selected ? .black : .secondary)
        }
    }
    
    private func toggleButton() {
        selected.toggle()
        onToggle()
    }
}

struct ToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        ToggleButton(text: "Mon", onToggle: {})
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
