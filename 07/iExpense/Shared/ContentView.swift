//
//  ContentView.swift
//  Shared
//
//  Created by JD on 01/07/20.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    
    @Published var items: [ExpenseItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
    
}

struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                List {
                    
                    ForEach(expenses.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            Text("$\(item.amount)")
                                .foregroundColor(getTextColor(amount: item.amount))
                        }
                    }
                    .onDelete(perform: removeItems)
                    
                }.listStyle(GroupedListStyle())
                
                Text("JD")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.white)
            }
            
            .navigationBarTitle(Text("iExpense"), displayMode: .large)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showingAddExpense = true
                                    }) {
                                        Image(systemName: "plus")
                                    }
            )
            
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: self.expenses)
            }
            
        }
        
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func getTextColor(amount: Int) -> Color {
        if amount < 100 {
            return .green
        } else if amount < 1000 {
            return .orange
        } else {
            return .red
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}


