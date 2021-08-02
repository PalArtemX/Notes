//
//  FontSizeView.swift
//  TextEditor
//
//  Created by Artem Palyutin on 02.08.2021.
//

import SwiftUI

struct FontSizeView: View {
    var body: some View {
        Text("FontSize")
//        Picker(selection: $selctionSize,
//               label: VStack {
//                Image(systemName: "textformat.size")
//                Text("\(selctionSize, specifier: "%.0f")")
//               },
//               content: {
//                ForEach(sizesText, id: \.self) { item in
//                    Text("\(item, specifier: "%.0f")")//.tag(zizeText)
//                }
//               })
//            .pickerStyle(MenuPickerStyle())
    }
}

struct FontSizeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FontSizeView()
                .previewLayout(.sizeThatFits)
            FontSizeView()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
    }
}
