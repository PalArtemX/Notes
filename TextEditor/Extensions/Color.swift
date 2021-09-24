//
//  Color.swift
//  TextEditor
//
//  Created by Artem Palyutin on 02.08.2021.
//

import Foundation
import SwiftUI

struct ThemeColor {
    let background = Color("Background")
    let buttonText = Color("ButtonText")
    let shadowColor = Color("ShadowColor")
    let text = Color("Text")
}

extension Color {
    static let themeColor = ThemeColor()
}
