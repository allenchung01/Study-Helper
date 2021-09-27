//
//  Colors.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import Foundation
import SwiftUI

extension UIColor {
    static let myPrimaryBackground = #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)
    static let mySecondaryBackground = #colorLiteral(red: 0.9694016576, green: 0.9695637822, blue: 0.9693804383, alpha: 1)
    static let myTertiaryBackground = #colorLiteral(red: 0.9853127599, green: 0.9854772687, blue: 0.9852910638, alpha: 1)
    static let myButtonColor = #colorLiteral(red: 0, green: 0.5610839128, blue: 1, alpha: 1)
}

extension Color {
    static let myShadow = Color(.black).opacity(0.025)
    static let myPrimaryBackground = Color(.myPrimaryBackground)
    static let mySecondaryBackground = Color(.mySecondaryBackground)
    static let myTertiaryBackground = Color(.myTertiaryBackground)
    static let myButtonColor = Color(.myButtonColor)
}
