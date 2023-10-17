//
//  ContentView.swift
//  WeSplit
//
//  Created by Marcos Barbosa on 16/10/23.
//

import SwiftUI


struct ContentView: View {
    
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 20

    
    let tipPercentages: Array<Int> = [10,15,20,25,0]
        var body: some View {
            NavigationStack{
                Form {
                    Section {
                        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad)
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2..<100){
                                Text("\($0) people")
                            }
                        }
                        .pickerStyle(.navigationLink)
                    }
                    Section {
                        Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
                .navigationTitle("WeSplit")
            }
    }
}
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            
        }
    }
    


