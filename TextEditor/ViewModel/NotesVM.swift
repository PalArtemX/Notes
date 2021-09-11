//
//  TextEditorVM.swift
//  TextEditor
//
//  Created by Artem Palyutin on 02.08.2021.
//

import Foundation
import CoreData
import UIKit
import SwiftUI

class NotesVM: ObservableObject {
    @Published var notes = NotesModel()
    @Published var savedEntities: [TextEditorEntity] = []
    
    let container: NSPersistentContainer
    
    
    init() {
        container = NSPersistentContainer(name: "TextEditorCoreData")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                print("💾 Error loading Core Data ⚠️, \(error.localizedDescription)")
            } else {
                print("💾 Successfully loaded Core Data. ✅")
            }
        }
        fetchTextEditor()
    }
    
    
    
    // MARK: - func
    func fetchTextEditor() {
        let request = NSFetchRequest<TextEditorEntity>(entityName: "TextEditorEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
            print("💾 Fetching OK ✅")
        } catch let error {
            print("💾 Error fetching ⚠️ \(error.localizedDescription)")
        }
    }
    
    func addText() {
        let newTextEditor = TextEditorEntity(context: container.viewContext)
        newTextEditor.text = notes.text
        newTextEditor.sizeText = Double(notes.selectionSize)
        newTextEditor.colorText = UIColor(notes.colorText)
        saveData()
        notes.text = ""
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchTextEditor()
            print("💾 Save. ✅")
        } catch let error {
            print("💾 Error saving data ⚠️ \(error)")
        }
    }
    
    func deleteEntity(entity: TextEditorEntity) {
        container.viewContext.delete(entity)
        saveData()
    }
    
}
