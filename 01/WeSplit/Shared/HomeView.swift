//
//  HomeView.swift
//  Shared
//
//  Created by JD on 29/06/20.
//

import SwiftUI

struct HomeView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    private let tipPercentages = [10, 15, 20, 25, 0]
    
    private let specifier = "%.2f"
    
    private var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        return grandTotal
    }
    
    private var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Form {
                    Section {
                        TextField("Amount", text: $checkAmount)
                            .keyboardType(.decimalPad)
                        
                        
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2 ..< 100) {
                                Text("\($0) people")
                            }
                        }
                    }
                    
                    Section(header: Text("How much tip do you want to leave?")) {
                        
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(0 ..< tipPercentages.count) {
                                Text("\(self.tipPercentages[$0])%")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("Total")) {
                        Text("$ \(grandTotal, specifier: specifier)")
                    }
                    
                    Section(header: Text("Amount per person")) {
                        Text("$ \(totalPerPerson, specifier: specifier)")
                    }
                    
                }
                
                Text("JD")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            .navigationBarTitle("WeSplit")
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
