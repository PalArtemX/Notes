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
    let sizesText: [CGFloat] = [8, 10, 12, 14, 16, 18, 20, 24 ,26 ,28, 36]
    var selectionSize: CGFloat = 20
    
    
    // MARK: - Color Text
    var colorText: Color = .themeColor.text
    
}
