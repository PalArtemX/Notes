//
//  HomeView.swift
//  TextEditor
//
//  Created by Artem Palyutin on 02.08.2021.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = TextEditorVM()
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Color
                Color.themeColor.background
                    .ignoresSafeArea()
                
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()], alignment: .center, spacing: nil, pinnedViews: [], content: {
                        ForEach(vm.savedEntities) { entity in
                                NavigationLink(
                                    destination: ListView(text: entity.text ?? "none"),
                                    label: {
                                        ListView(text: entity.text ?? "none")
                                            .foregroundColor(.themeColor.text)
                                    })
                            }
                    })
                }
                    
                
            }
            .navigationBarItems(trailing: Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Add")
            }))
            .navigationTitle("Notes")
        }
        .sheet(isPresented: $showSheet, content: {
            TextEditorView(vm: vm)
        })
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
