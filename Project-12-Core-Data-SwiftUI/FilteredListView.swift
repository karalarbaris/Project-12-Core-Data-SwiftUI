//
//  FilteredListView.swift
//  Project-12-Core-Data-SwiftUI
//
//  Created by Baris Karalar on 9.07.2021.
//}

import SwiftUI

//Dynamically filtering @FetchRequest with SwiftUI

struct FilteredListView: View {
    
    var fetchRequest: FetchRequest<Singer>
    
    var singers: FetchedResults<Singer> {
        fetchRequest.wrappedValue
    }
    
    var body: some View {
        
        List(singers, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
        
        
    }
    
    init(filter: String, predicate: String) {
        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \Singer.firstName, ascending: false)  ], predicate: NSPredicate(format: "\(predicate) BEGINSWITH %@", filter))
    }
    
}
