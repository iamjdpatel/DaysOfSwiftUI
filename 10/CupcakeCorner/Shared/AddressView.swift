//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by JD on 02/07/20.
//

import SwiftUI

struct AddressView: View {
    
    @ObservedObject var order: Order

    var body: some View {
        
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }

            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Check out")
                }
            }.disabled(order.hasValidAddress == false)
            
        }
        .navigationBarTitle("Delivery details", displayMode: .inline)
    }
}

