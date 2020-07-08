//
//  SingerView.swift
//  CoreDataProject
//
//  Created by JD on 08/07/20.
//

import SwiftUI
import CoreData

struct SingerView: View {
    
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
                    Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
                }
                
                Button("Add Examples") {
                    let taylor = Singer(context: self.moc)
                    taylor.firstName = "Taylor"
                    taylor.lastName = "Swift"
                    
                    let ed = Singer(context: self.moc)
                    ed.firstName = "Ed"
                    ed.lastName = "Sheeran"
                    
                    let adele = Singer(context: self.moc)
                    adele.firstName = "Adele"
                    adele.lastName = "Adkins"
                    
                    try? self.moc.save()
                }.padding()
                
                HStack {
                
                    Button("Show A") {
                        self.lastNameFilter = "A"
                    }.padding()
                    
                    Button("Show S") {
                        self.lastNameFilter = "S"
                    }.padding()
                    
                }
                
            }
            .navigationBarTitle(Text("Singer"), displayMode: .inline)
            
        }
        
    }
    
}



struct FilteredList<T: NSManagedObject, Content: View>: View {
    
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }
    
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
    
}
