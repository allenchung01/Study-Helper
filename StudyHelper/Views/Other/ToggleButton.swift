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
                .padding(10)
                .background(selected ? Color.myButtonColor : Color(.systemGray5))
                .cornerRadius(10.0)
                .foregroundColor(Color.mySecondaryBackground)
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
