//
//  ListView.swift
//  TextEditor
//
//  Created by Artem Palyutin on 03.08.2021.
//

import SwiftUI

struct ListView: View {
    
    let text: String
    let colorText: Color = .themeColor.text
    let font: CGFloat
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                
                Color.themeColor.background.cornerRadius(15)
                       
                Text(text)
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
        ListView(text: "Hello", font: 20)
    }
}
