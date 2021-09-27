//
//  ConditionalModifiers.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/22/21.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition { transform(self) }
        else { self }
    }
}
