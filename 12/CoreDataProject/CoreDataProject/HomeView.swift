//
//  HomeView.swift
//  CoreDataProject
//
//  Created by JD on 08/07/20.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @State private var showWizardView: Bool = false
    @State private var showShipView: Bool = false
    @State private var showSingerView: Bool = false
    @State private var showCandyView: Bool = false

    var context: NSManagedObjectContext

    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 30) {
                
                Spacer()
                
                Button("Wizard View") {
                    self.showWizardView.toggle()
                }.sheet(isPresented: $showWizardView) {
                    WizardView().environment(\.managedObjectContext, context)
                }
                
                Button("Ship View") {
                    self.showShipView.toggle()
                }.sheet(isPresented: $showShipView) {
                    ShipView().environment(\.managedObjectContext, context)
                }
                
                Button("Singer View") {
                    self.showSingerView.toggle()
                }.sheet(isPresented: $showSingerView) {
                    SingerView().environment(\.managedObjectContext, context)
                }
                
                Button("Candy View") {
                    self.showCandyView.toggle()
                }.sheet(isPresented: $showCandyView) {
                    CandyView().environment(\.managedObjectContext, context)
                }
                
                Spacer()
                
                Text("JD")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                
            }
            
            .navigationBarTitle(Text("CoreData"), displayMode: .inline)
            
        }
        
    }
    
}

