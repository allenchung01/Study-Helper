//
//  Colors.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/17/21.
//

import Foundation
import SwiftUI

extension UIColor {
    
    //static let myPrimaryBackground = #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)
    //static let mySecondaryBackground = #colorLiteral(red: 0.9694016576, green: 0.9695637822, blue: 0.9693804383, alpha: 1)
    //static let myTertiaryBackground = #colorLiteral(red: 0.9853127599, green: 0.9854772687, blue: 0.9852910638, alpha: 1)
    static let myButtonColor = #colorLiteral(red: 0.1635575593, green: 0.6703689098, blue: 0.995184958, alpha: 1)
    static let myComplementaryColor = #colorLiteral(red: 0.9332260489, green: 0.9908927083, blue: 0.9757353663, alpha: 1)
    static let myComplementaryColor2 = #colorLiteral(red: 0.9958586097, green: 0.955921948, blue: 0.9725397229, alpha: 1)
    static let myComplementaryColor3 = #colorLiteral(red: 0.8983748555, green: 0.9803485274, blue: 0.9911509156, alpha: 1)
    static let myComplementaryColor4 = #colorLiteral(red: 0.8852431178, green: 0.8909566402, blue: 0.9979204535, alpha: 1)
    static let myErrorRed = #colorLiteral(red: 1, green: 0.6420148015, blue: 0.6365351081, alpha: 1)
    
    
    // If I wanted to make it compatible with dark mode.
    static var myPrimaryBackground: UIColor {
        if UITraitCollection.current.userInterfaceStyle == .light {
            return #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)
        } else {
            return #colorLiteral(red: 0.1561781168, green: 0.1562114656, blue: 0.1561737061, alpha: 1)
        }
    }
    
    static var mySecondaryBackground: UIColor {
        if UITraitCollection.current.userInterfaceStyle == .light {
            return #colorLiteral(red: 0.9694016576, green: 0.9695637822, blue: 0.9693804383, alpha: 1)
        } else {
            return  #colorLiteral(red: 0.1914193928, green: 0.1914584041, blue: 0.1914142966, alpha: 1)
        }
    }
    
    static var myTertiaryBackground: UIColor {
        if UITraitCollection.current.userInterfaceStyle == .light {
            return #colorLiteral(red: 0.9853127599, green: 0.9854772687, blue: 0.9852910638, alpha: 1)
        } else {
            return #colorLiteral(red: 0.176451683, green: 0.1764883399, blue: 0.1764469147, alpha: 1)
        }
    }

}

extension Color {
    //static let myShadow = Color(.black).opacity(0.025)
    static var myShadow: Color {
        if UITraitCollection.current.userInterfaceStyle == .light {
            return Color(.black).opacity(0.025)
        } else {
            return Color(.white).opacity(0.025)
        }
    }
    static var myPrimaryBackground: Color { Color(.myPrimaryBackground) }
    static var mySecondaryBackground: Color { Color(.mySecondaryBackground) }
    static var myTertiaryBackground: Color { Color(.myTertiaryBackground) }
    
    static let myButtonColor = Color(.myButtonColor)
    static let myComplementaryColor = Color(.myComplementaryColor)
    static let myComplementaryColor2 = Color(.myComplementaryColor2)
    static let myComplementaryColor3 = Color(.myComplementaryColor3)
    static let myComplementaryColor4 = Color(.myComplementaryColor4)
    static let myErrorRed = Color(.myErrorRed)
}
