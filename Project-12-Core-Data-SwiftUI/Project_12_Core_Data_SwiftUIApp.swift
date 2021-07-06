//
//  Project_12_Core_Data_SwiftUIApp.swift
//  Project-12-Core-Data-SwiftUI
//
//  Created by Baris Karalar on 6.07.2021.
//

import SwiftUI

@main
struct Project_12_Core_Data_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
