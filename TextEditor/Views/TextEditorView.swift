//
//  ContentView.swift
//  TextEditor
//
//  Created by Artem Palyutin on 01.08.2021.
//

import SwiftUI

struct TextEditorView: View {
    
    @ObservedObject var vm: TextEditorVM
    
    
    var body: some View {
        
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
                    Image(systemName: "textformat.size")
                }
                .padding()
                .font(.headline)
                .foregroundColor(.themeColor.buttonText)
                    
            
                TextEditor(text: $vm.textEditorModel.text)
                    .font(Font.system(size: vm.textEditorModel.selctionSize))
            }
            .padding()
            //.background(Color.gray)
            
            
            
            
        }
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView(vm: TextEditorVM())
            
    }
}
