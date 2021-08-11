//
//  HomeView.swift
//  TextEditor
//
//  Created by Artem Palyutin on 02.08.2021.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = NotesVM()
    @State private var showSheet = false
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 140, maximum: 300))]
    
    var body: some View {
        NavigationView {
                
                ScrollView {
                    
                    LazyVGrid(columns: columns) {
                        
                        ForEach(vm.savedEntities) { entity in
                            
                                NavigationLink(
                                    destination: ListView(text: entity.text ?? "nothing").animation(.spring()),
                                    label: {
                                        ListView(text: entity.text ?? "nothing")
                                            .foregroundColor(.themeColor.text)
                                    })
                                    //.aspectRatio(2/2.5, contentMode: .fit)
                                    .frame(maxHeight: 200)
                                    
                                    .contextMenu(menuItems: {
                                        // MARK: - Menu bar: Add
                                        Button(action: {
                                            showSheet.toggle()
                                        }, label: {
                                            Label("Add", systemImage: "note.text.badge.plus")
                                        })
                                        
                                        // MARK: - Menu bar: Copy
                                        Button(action: {}, label: {
                                            Label("Copy", systemImage: "doc.on.doc")
                                        })
                                        
                                        Divider()
                                        
                                       // MARK: - Menu bar: Delete
                                        Button(action: {
                                                vm.deleteEntity(entity: entity)
                                        }, label: {
                                            Label("Delete", systemImage: "trash")
                                                .accentColor(.red)
                                        })
                                    }) // contexMenu
                            
                        } // ForEach
                    } // LazyVGrid
                } // ScrollView

            .navigationBarItems(trailing:
                                    Button(action: {
                                        showSheet.toggle()
                                    }, label: {
                                        Label("Add", systemImage: "note.text.badge.plus")
                                    }))
            
            .navigationTitle("Notes")
        } // NavigationView
        .sheet(isPresented: $showSheet) { TextEditorView(vm: vm) }
        
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
