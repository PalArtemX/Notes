//
//  ListView.swift
//  TextEditor
//
//  Created by Artem Palyutin on 03.08.2021.
//

import SwiftUI

struct ListView: View {
    
    let text: String
    
    var body: some View {
        
        
        ZStack(alignment: .topLeading) {
            
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.themeColor.buttonText, lineWidth: 1.5)
            
            Text(text)
                .padding()
            
            
        }
        .padding()
        
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(text: "Hello")
    }
}
