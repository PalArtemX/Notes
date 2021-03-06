//
//  ListView.swift
//  TextEditor
//
//  Created by Artem Palyutin on 03.08.2021.
//

import SwiftUI

struct ListView: View {
    
    let text: String
    let colorText: Color
    let font: CGFloat
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                
                Color.themeColor.background.cornerRadius(15)
                    .shadow(color: .themeColor.shadowColor, radius: 3, x: 0, y: 5)
                    
                    
                Text(text)
                    //.foregroundColor(.green)
                    .foregroundColor(colorText)
                    .padding()
                    .font(Font.system(size: font))
            }
            .animation(.spring())
            .padding()
            
        }
    }
}










struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListView(text: "Hello", colorText: .themeColor.text, font: 20)
            ListView(text: "Hello", colorText: .themeColor.text, font: 20)
                .preferredColorScheme(.dark)
        }
    }
}
