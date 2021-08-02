//
//  ColorFontView.swift
//  TextEditor
//
//  Created by Artem Palyutin on 02.08.2021.
//

import SwiftUI

struct ColorFontView: View {
    
    @ObservedObject var vm: TextEditorVM
    
    var body: some View {
        ColorPicker("", selection: $vm.textEditorModel.colorText, supportsOpacity: true)
            .frame(width: 30, alignment: .center)
    }
}

struct ColorFontView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ColorFontView(vm: TextEditorVM())
                .previewLayout(.sizeThatFits)
            ColorFontView(vm: TextEditorVM())
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
    }
}
