//
//  CheckBox.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/22/21.
//

import SwiftUI

struct CheckBox: View {
    @Environment(\.colorScheme) var colorScheme
    
    var selected: Bool
    var onToggle: () -> Void
    
    var body: some View {
        Button(action: toggleButton) {
            Image(systemName: selected ? "checkmark.circle.fill" : "circle")
                .foregroundColor(colorScheme == .light ? .black : .white)
        }
    }
    
    private func toggleButton() {
        onToggle()
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox(selected: true, onToggle: {})
            .padding(30)
            .previewLayout(.sizeThatFits)
    }
}
