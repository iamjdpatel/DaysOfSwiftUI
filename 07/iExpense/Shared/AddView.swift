//
//  AddView.swift
//  iExpense
//
//  Created by JD on 01/07/20.
//

import SwiftUI

struct AddView: View {
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""

    static let types = ["Business", "Personal"]
    @ObservedObject var expenses: Expenses

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
    
        NavigationView {
        
            Form {
            
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
                
            }
            
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
                
            })
            
        }
        
    }
    
}

