//
//  ContentView.swift
//  TextEditor
//
//  Created by Artem Palyutin on 01.08.2021.
//

import SwiftUI

struct TextEditorView: View {
    
    @State var text = "3453gfer"
    let sizesText: [CGFloat] = [10, 15, 20, 25, 30, 35]
    @State var selctionSize: CGFloat = 20
    
    var body: some View {
        
        ZStack {
            // Background
            Color.themeColor.background
                .ignoresSafeArea()
            
            
            VStack {
                
                HStack {
                    Picker(selection: $selctionSize,
                           label: VStack {
                            Image(systemName: "textformat.size")
                            Text("\(selctionSize, specifier: "%.0f")")
                           },
                           content: {
                            ForEach(sizesText, id: \.self) { item in
                                Text("\(item, specifier: "%.0f")")//.tag(zizeText)
                            }
                           })
                        .pickerStyle(MenuPickerStyle())
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
                    
            
                TextEditor(text: $text)
                    .font(Font.system(size: selctionSize))
            }
            .padding()
            //.background(Color.gray)
            
            
            
            
        }
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView()
            
    }
}
