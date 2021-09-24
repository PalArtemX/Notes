//
//  FontSizeView.swift
//  TextEditor
//
//  Created by Artem Palyutin on 02.08.2021.
//

import SwiftUI

struct FontSizeView: View {
    
    @ObservedObject var vm: NotesVM
    
    var body: some View {

        VStack {
            Image(systemName: "textformat.size")
                
            Picker(selection: $vm.notes.selectionSize,
                   label: VStack {
                    Image(systemName: "textformat.size") // FIXME: - Image(systemName: "textformat.size")
                    Text("\(vm.notes.selectionSize, specifier: "%.0f")")
                        .bold()
                
                   },
                   content: {
                    ForEach(vm.notes.sizesText, id: \.self) { item in
                        Text("\(item, specifier: "%.0f")")//.tag(sizeText)
                    }
                   })
                .pickerStyle(MenuPickerStyle())
        }
        .foregroundColor(.themeColor.buttonText)
    }
}










struct FontSizeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FontSizeView(vm: NotesVM())
                .previewLayout(.sizeThatFits)
            FontSizeView(vm: NotesVM())
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
    }
}
