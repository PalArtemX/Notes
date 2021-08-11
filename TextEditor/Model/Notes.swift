//
//  TextEditor.swift
//  TextEditor
//
//  Created by Artem Palyutin on 02.08.2021.
//

import Foundation
import SwiftUI


struct NotesModel {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    // MARK: - TextEditor
    var text = ""
    
    
    // MARK: - Size Text
    let sizesText: [CGFloat] = [10, 15, 20, 25, 30, 35]
    var selectionSize: CGFloat = 20
    
    
    // MARK: - Color Text
    var colorText: Color = .themeColor.text
    
}
