//
//  ColorFontView.swift
//  TextEditor
//
//  Created by Artem Palyutin on 02.08.2021.
//

import SwiftUI

struct ColorFontView: View {
    
    @ObservedObject var vm: NotesVM
    
    var body: some View {
        ColorPicker("", selection: $vm.notes.colorText, supportsOpacity: true)
            .frame(width: 30, alignment: .center)
    }
}










struct ColorFontView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ColorFontView(vm: NotesVM())
                .previewLayout(.sizeThatFits)
            ColorFontView(vm: NotesVM())
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
    }
}
