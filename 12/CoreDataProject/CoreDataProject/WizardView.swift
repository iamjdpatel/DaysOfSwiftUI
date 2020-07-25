//
//  WizardView.swift
//  CoreDataProject
//
//  Created by JD on 08/07/20.
//

import SwiftUI

struct WizardView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        NavigationView {
            VStack {
                List(wizards, id: \.self) { wizard in
                    Text(wizard.name ?? "Unknown")
                }
                Button("Add") {
                    let wizard = Wizard(context: self.moc)
                    wizard.name = "Harry Potter"
                }.padding()
                Button("Save") {
                    do {
                        try self.moc.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }.padding()
            }
            .navigationBarTitle(Text("Wizard"), displayMode: .inline)
        }
    }
}
