//
//  HomeView.swift
//  TextEditor
//
//  Created by Artem Palyutin on 02.08.2021.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = TextEditorVM()
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Color
                Color.themeColor.background
                    .ignoresSafeArea()
                
                Text("wedwe")
                
                
                
            }
            .navigationTitle("Notes")
        }
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
