//
//  HomeView.swift
//  CupcakeCorner
//
//  Created by JD on 02/07/20.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var order = Order()

    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(0..<Order.types.count, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }

                    Stepper(value: $order.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }

                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Add extra frosting")
                        }

                        Toggle(isOn: $order.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery details")
                    }
                }
                
            }
            .navigationBarTitle("Cupcake Corner", displayMode: .large)
            
        }
        
    }
    
}


