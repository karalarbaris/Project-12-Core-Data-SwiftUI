//
//  ContentView.swift
//  Project-12-Core-Data-SwiftUI
//
//  Created by Baris Karalar on 6.07.2021.
//

import SwiftUI
import CoreData

////One-to-many relationships with Core Data, SwiftUI, and @FetchRequest
//
//struct ContentView: View {
//
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(entity: Country.entity(), sortDescriptors: []) var countries: FetchedResults<Country>
//
//    var body: some View {
//
//        VStack {
//
//            List {
//                ForEach(countries, id: \.self) { country in
//                    Section(header: Text(country.wrappedFullName)) {
//                        ForEach(country.candyArray, id: \.self) { candy in
//                            Text(candy.wrappedName)
//                        }
//                    }
//                }
//            }
//
//            Button("Add") {
//                let candy1 = Candy(context: moc)
//                candy1.name = "candy1 name"
//                candy1.origin = Country(context: moc)
//                candy1.origin?.shortName = "UK"
//                candy1.origin?.fullName = "United Kingdom"
//
//                let candy2 = Candy(context: self.moc)
//                candy2.name = "KitKat"
//                candy2.origin = Country(context: self.moc)
//                candy2.origin?.shortName = "UK"
//                candy2.origin?.fullName = "United Kingdom"
//                let candy3 = Candy(context: self.moc)
//                candy3.name = "Twix"
//                candy3.origin = Country(context: self.moc)
//                candy3.origin?.shortName = "UK"
//                candy3.origin?.fullName = "United Kingdom"
//                let candy4 = Candy(context: self.moc)
//                candy4.name = "Toblerone"
//                candy4.origin = Country(context: self.moc)
//                candy4.origin?.shortName = "CH"
//                candy4.origin?.fullName = "Switzerland"
//
//                try? moc.save()
//
//            }
//
//        }
//
//    }
//}

    //Dynamically filtering @FetchRequest with SwiftUI
    
    //Filtering @FetchRequest using NSPredicate
    
    struct ContentView: View {
    
        @Environment(\.managedObjectContext) var moc
        @State private var lastNameFilter = "A"
        @State private var predicate = "lastName"
        
        let predicates = ["firstName", "lastName"]
        
        var body: some View {
    
            VStack {
    
                
                // list of matching singers
                
                FilteredListView(filter: lastNameFilter,predicate: predicate)
    
    
                Button {
                    let taylor = Singer(context: self.moc)
                    taylor.firstName = "SSSaylor"
                    taylor.lastName = "Swift"
    
                    let ed = Singer(context: self.moc)
                    ed.firstName = "Ed"
                    ed.lastName = "Sheeran"
    
                    let adele = Singer(context: self.moc)
                    adele.firstName = "SSSAdele"
                    adele.lastName = "Adkins"
                    
                    let taylor2 = Singer(context: self.moc)
                    taylor2.firstName = "Taylor2"
                    taylor2.lastName = "Swift2"
    
                    let ed2 = Singer(context: self.moc)
                    ed2.firstName = "Ed2"
                    ed2.lastName = "Sheeran2"
    
                    let adele2 = Singer(context: self.moc)
                    adele2.firstName = "Adele2"
                    adele2.lastName = "Adkins2"
    
                    try? moc.save()
    
                } label: {
                    Text("Add Example")
                        .padding()
                }
                
                Picker("Select predicate paremeter", selection: $predicate) {
                    ForEach(predicates, id: \.self) {
                        Text($0)
                    }
                    
                }.pickerStyle(SegmentedPickerStyle())

    
                Button {
                    lastNameFilter = "A"
                } label: {
                    Text("Show A")
                        .padding()
                }
    
                Button {
                    lastNameFilter = "S"
//                    predicate = "firstName"
                    print(predicate)

                } label: {
                    Text("Show S")
                        .padding()
                }
    
    
            }
    
    
    
    
        }
    
    }
    
    ////Filtering @FetchRequest using NSPredicate
    //
    //struct ContentView: View {
    //
    //    @Environment(\.managedObjectContext) var moc
    //    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "universe in %@", ["Aliens", "Firefly", "Star Trek"])) var ships: FetchedResults<Ship>
    //
    //    //NSPredicate(format: "universe == %@", "Star Wars")
    //    //NSPredicate(format: "universe == %@", "Star Wars")
    //    //NSPredicate(format: "name < %@", "F")
    //    //NSPredicate(format: "universe in %@", ["Aliens", "Firefly", "Star Trek"])
    //    //NSPredicate(format: "name BEGINSWITH %@", "E"))
    //    //NSPredicate(format: "name BEGINSWITH[c] %@", "e"))
    //    //NSPredicate(format: "NOT name CONTAINS[c] %@", "e"))
    //
    //
    //    var body: some View {
    //
    //        VStack {
    //
    //            List(ships, id: \.self) { ship in
    //                Text(ship.name ?? "Unknown name")
    //            }
    //
    //            Button {
    //                let ship1 = Ship(context: moc)
    //                ship1.name = "Enterprise"
    //                ship1.universe = "Star Trek"
    //                let ship2 = Ship(context: self.moc)
    //                ship2.name = "Defiant"
    //                ship2.universe = "Star Trek"
    //                let ship3 = Ship(context: self.moc)
    //                ship3.name = "Millennium Falcon"
    //                ship3.universe = "Star Wars"
    //                let ship4 = Ship(context: self.moc)
    //                ship4.name = "Executor"
    //                ship4.universe = "Star Wars"
    //
    //                do {
    //                    try moc.save()
    //                } catch {
    //                    print(error.localizedDescription)
    //                }
    //
    //            } label: {
    //                Text("Add examples")
    //            }
    //
    //
    //        }
    //
    //
    //
    //
    //    }
    //
    //}
    
    ////Ensuring Core Data objects are unique using constraints
    //
    //struct ContentView: View {
    //
    //    @Environment(\.managedObjectContext) var moc
    //
    //    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    //
    //    var body: some View {
    //
    //        VStack {
    //
    //            List(wizards, id: \.self) { wizard in
    //                Text(wizard.name ?? "No name")
    //            }
    //
    //            Button {
    //                let wizard = Wizard(context: moc)
    //                wizard.name = "Büyücü baro"
    //            } label: {
    //                Text("Add")
    //            }
    //
    //            Button {
    //                do {
    //                    try moc.save()
    //                } catch  {
    //                    print(error.localizedDescription)
    //                }
    //            } label: {
    //                Text("Save")
    //            }
    //
    //
    //
    //
    //        }
    //
    //    }
    //
    //}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


//struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//
//    var body: some View {
//        List {
//            ForEach(items) { item in
//                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//            }
//            .onDelete(perform: deleteItems)
//        }
//        .toolbar {
//            #if os(iOS)
//            EditButton()
//            #endif
//
//            Button(action: addItem) {
//                Label("Add Item", systemImage: "plus")
//            }
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
