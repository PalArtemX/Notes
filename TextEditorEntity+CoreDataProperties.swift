//
//  TextEditorEntity+CoreDataProperties.swift
//  TextEditor
//
//  Created by Artem Palyutin on 12.08.2021.
//
//

import Foundation
import CoreData
import UIKit

extension TextEditorEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TextEditorEntity> {
        return NSFetchRequest<TextEditorEntity>(entityName: "TextEditorEntity")
    }

    @NSManaged public var sizeText: Double
    @NSManaged public var text: String?
    @NSManaged public var colorText: UIColor?

}

extension TextEditorEntity : Identifiable {

}
