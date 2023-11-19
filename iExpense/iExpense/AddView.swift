//
//  AddView.swift
//  iExpense
//
//  Created by Marcos Barbosa on 16/11/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var currency = "USD"
    
    var expenses: Expenses
    
    let types = ["Business","Personal"]
    let currencies = ["USD","EUR","JPY","GBP","CAD","BRL"]
    
    var body: some View {
       
        
        NavigationStack{
            Form{
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                Picker("Select currency", selection: $currency) {
                    ForEach(currencies, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                TextField("Amount", value: $amount, format: .currency(code: currency))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar{
                Button("Save"){
                    let item = ExpenseItem(name: name, type: type, amount: amount, currency: currency)
                    if item.type == "Personal" {
                        expenses.personalItems.append(item)
                    } else {
                        expenses.businessItems.append(item)
                    }
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
