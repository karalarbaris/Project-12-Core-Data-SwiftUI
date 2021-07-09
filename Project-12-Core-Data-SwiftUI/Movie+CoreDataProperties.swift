//
//  Movie+CoreDataProperties.swift
//  Project-12-Core-Data-SwiftUI
//
//  Created by Baris Karalar on 9.07.2021.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16
    
    public var wrappedTitle: String {
        title ?? "Unknown title"
    }
    
    public var wrappedDirector: String {
        director ?? "Unknown director"
    }

}

extension Movie : Identifiable {

}
