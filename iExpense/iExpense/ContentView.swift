//
//  ContentView.swift
//  iExpense
//
//  Created by Marcos Barbosa on 13/11/23.
//

import SwiftUI

struct ExpenseItem: Identifiable{
    
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}

struct ContentView: View {
    
    @State private var expenses = Expenses()
    var body: some View {
        
        NavigationStack{
            List{
                ForEach(expenses.items){ item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .toolbar{
                Button("Add Expense", systemImage: "plus") {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                }
            }
            .navigationTitle("iExpense")
        }
    }
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
