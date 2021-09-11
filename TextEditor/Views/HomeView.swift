//
//  HomeView.swift
//  TextEditor
//
//  Created by Artem Palyutin on 02.08.2021.
//

import SwiftUI
import UIKit


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
                            destination:
                                ListView(
                                    text: entity.text ?? "nothing",
                                    colorText: Color(entity.colorText ?? UIColor(.themeColor.text)),
                                    font: CGFloat(entity.sizeText)).animation(.spring()),
                            label: {
                                ListView(
                                    text: entity.text ?? "nothing",
                                    colorText: Color(entity.colorText ?? UIColor(.themeColor.text)),
                                    font: CGFloat(entity.sizeText))
                                    .foregroundColor(Color(entity.colorText ?? UIColor(.themeColor.text)))
                            })
                            //.aspectRatio(2/2.5, contentMode: .fit)
                            .frame(maxHeight: 200)
                            
                            .contextMenu(menuItems: {
                                // MARK: - Menu bar: Delete
                                Button(action: {
                                    vm.deleteEntity(entity: entity)
                                    SoundManager.instance.playSound(sound: .delete)
                                }, label: {
                                    Text("Delete", comment: "contextMenu")
                                    Image(systemName: "trash")
                                })
                            }) // contextMenu
                    } // ForEach
                } // LazyVGrid
            } // ScrollView
            
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showSheet.toggle()
                                    }, label: {
                                        Image(systemName: "note.text.badge.plus")
                                            .renderingMode(.original)
                                        Text("Add", comment: "navigationBarItem")
                                    }))
            
            .navigationTitle(Text("Notes", comment: "navigationTitle"))
        } // NavigationView
        .sheet(isPresented: $showSheet) { TextEditorView(vm: vm) }
        
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
        }
    }
}
