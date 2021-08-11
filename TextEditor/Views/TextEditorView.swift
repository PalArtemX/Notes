//
//  ContentView.swift
//  TextEditor
//
//  Created by Artem Palyutin on 01.08.2021.
//

import SwiftUI

struct TextEditorView: View {
    
    @ObservedObject var vm: NotesVM
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
                        Image(systemName: "circle")
                        Spacer()
                        Image(systemName: "circle")
                        Spacer()
                        Image(systemName: "circle")
                        Spacer()
                        ColorFontView(vm: vm)
                    }
                    .padding()
                    .font(.headline)
                    .foregroundColor(.themeColor.buttonText)
                    
                    
                    TextEditor(text: $vm.notes.text)
                        .font(Font.system(size: vm.notes.selectionSize))
                        .foregroundColor(vm.notes.colorText)
                        .cornerRadius(10)
                }
                .padding()
                
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                                        vm.addText()
                                        presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "note.text.badge.plus")
                                            .renderingMode(.original)
                                        Text("Save")
                                    }))
            
            .navigationTitle("Text Editor")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextEditorView(vm: NotesVM())
            TextEditorView(vm: NotesVM())
                .preferredColorScheme(.dark)
        }
    }
}
