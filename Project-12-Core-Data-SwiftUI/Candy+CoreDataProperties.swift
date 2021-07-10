//
//  Candy+CoreDataProperties.swift
//  Project-12-Core-Data-SwiftUI
//
//  Created by Baris Karalar on 10.07.2021.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    public var wrappedName: String {
        name ?? "Unknown name"
    }

}

extension Candy : Identifiable {

}
