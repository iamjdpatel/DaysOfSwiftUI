//
//  ShipView.swift
//  CoreDataProject
//
//  Created by JD on 08/07/20.
//

import CoreData
import SwiftUI

struct ShipView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "universe == 'Star Wars'")) var ships: FetchedResults<Ship>
    
    var body: some View {
        NavigationView {
            VStack {
                List(ships, id: \.self) { ship in
                    Text(ship.name ?? "Unknown name")
                }
                
                Button("Add Examples") {
                    let ship1 = Ship(context: self.moc)
                    ship1.name = "Enterprise"
                    ship1.universe = "Star Trek"
                    
                    let ship2 = Ship(context: self.moc)
                    ship2.name = "Defiant"
                    ship2.universe = "Star Trek"
                    
                    let ship3 = Ship(context: self.moc)
                    ship3.name = "Millennium Falcon"
                    ship3.universe = "Star Wars"
                    
                    let ship4 = Ship(context: self.moc)
                    ship4.name = "Executor"
                    ship4.universe = "Star Wars"
                    
                    try? self.moc.save()
                }
            }
            .navigationBarTitle(Text("Ship"), displayMode: .inline)
        }
    }
}
