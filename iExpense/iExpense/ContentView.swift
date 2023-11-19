//
//  ContentView.swift
//  iExpense
//
//  Created by Marcos Barbosa on 13/11/23.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable{
    
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currency: String
}

@Observable
class Expenses {
    
    var personalItems = [ExpenseItem]() {
        didSet{
            saveToUserDefaults(items: personalItems, key: "personalKey")
        }
    }
    
    var businessItems = [ExpenseItem]() {
        didSet {
            saveToUserDefaults(items: businessItems, key: "businessKey")
        }
    }
   
    private func saveToUserDefaults(items: [ExpenseItem], key: String) {
        if let encodedItems = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedItems, forKey: key)
        }
    }
    
    init(){
        decodeFromUserDefaults(key: "personalKey", into: &personalItems)
        decodeFromUserDefaults(key: "businessKey", into: &businessItems)
    }
    
    private func decodeFromUserDefaults(key: String, into items: inout [ExpenseItem]) {
        if let savedItems = UserDefaults.standard.data(forKey: key) {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
            }
        }
    }
   
}

struct ContentView: View {
    
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var colors = [""]
    
    var body: some View {
        
        NavigationStack{
            List{
                Section("Personal"){
                    ForEach(expenses.personalItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            Text(item.amount, format: .currency(code: item.currency))
                                .foregroundStyle(getColor(amount: item.amount))
                            
                        }
                    }
                    .onDelete { indexSet in
                            removeExpense(at: indexSet, from: "Personal")
                        }
                }
                
                Section("Business"){
                    ForEach(expenses.businessItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            Text(item.amount, format: .currency(code: item.currency))
                                .foregroundStyle(getColor(amount: item.amount))
                            
                        }
                    }
                    .onDelete { indexSet in
                            removeExpense(at: indexSet, from: "Business")
                        }
                }
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    func removeExpense(at offsets: IndexSet, from expense: String){
        switch expense {
        case "Personal":
            expenses.personalItems.remove(atOffsets: offsets)
        case "Business":
            expenses.businessItems.remove(atOffsets: offsets)
        default:
            break
        }
    }
    
    
    func getColor(amount: Double) -> Color {
        if amount <= 35 {
            return .green
        } else if amount <= 100.0 {
            return .orange
        } else  {
            return .red
        }
    }
}

#Preview {
    ContentView()
}
