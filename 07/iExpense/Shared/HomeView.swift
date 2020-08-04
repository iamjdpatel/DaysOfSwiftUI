//
//  HomeView.swift
//  Shared
//
//  Created by JD on 01/07/20.
//

import SwiftUI

struct HomeView: View {
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
                    .foregroundColor(.gray)
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
    
    private func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    private func getTextColor(amount: Int) -> Color {
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
        HomeView()
            .preferredColorScheme(.dark)
    }
}


