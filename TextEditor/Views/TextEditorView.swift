//
//  ContentView.swift
//  TextEditor
//
//  Created by Artem Palyutin on 01.08.2021.
//

import SwiftUI

struct TextEditorView: View {
    
    @ObservedObject var vm: TextEditorVM
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                // Background
                Color.themeColor.background
                    .ignoresSafeArea()
                
                
                VStack {
                    HStack {
                        FontSizeView(vm: vm)
                        Spacer()
                        Image(systemName: "list.dash")
                        Spacer()
                        Image(systemName: "character")
                        Spacer()
                        Image(systemName: "textformat.abc.dottedunderline")
                        Spacer()
                        ColorFontView(vm: vm)
                    }
                    .padding()
                    .font(.headline)
                    .foregroundColor(.themeColor.buttonText)
                    
                    
                    TextEditor(text: $vm.textEditorModel.text)
                        .font(Font.system(size: vm.textEditorModel.selctionSize))
                        .foregroundColor(vm.textEditorModel.colorText)
                        .cornerRadius(10)
                }
                .padding()
                
            }
            .navigationBarItems(trailing: Button(action: {
                vm.addText(text: vm.textEditorModel.text)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "square.and.arrow.down")
                .foregroundColor(.blue)
                .font(.title)
            }))
            
            .navigationTitle("Text Editor")
            //.navigationBarTitleDisplayMode(.inline)
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextEditorView(vm: TextEditorVM())
            TextEditorView(vm: TextEditorVM())
                .preferredColorScheme(.dark)
        }
    }
}
