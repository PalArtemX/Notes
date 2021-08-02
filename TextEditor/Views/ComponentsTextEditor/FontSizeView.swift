//
//  FontSizeView.swift
//  TextEditor
//
//  Created by Artem Palyutin on 02.08.2021.
//

import SwiftUI

struct FontSizeView: View {
    
    @ObservedObject var vm: TextEditorVM
    
    var body: some View {

        Picker(selection: $vm.textEditorModel.selctionSize,
               label: VStack {
                Image(systemName: "textformat.size")
                Text("\(vm.textEditorModel.selctionSize, specifier: "%.0f")")
               },
               content: {
                ForEach(vm.textEditorModel.sizesText, id: \.self) { item in
                    Text("\(item, specifier: "%.0f")")//.tag(zizeText)
                }
               })
            .pickerStyle(MenuPickerStyle())
    }
}

struct FontSizeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FontSizeView(vm: TextEditorVM())
                .previewLayout(.sizeThatFits)
            FontSizeView(vm: TextEditorVM())
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
    }
}
