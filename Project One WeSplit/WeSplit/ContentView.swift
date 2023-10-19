
import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 0
    
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages: [Int] = [0, 10, 15, 20, 25]
    
    var total: (totalPerPerson: Double, checkAmountPlusTip: Double) {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return (amountPerPerson, grandTotal)
    }
    
        var body: some View {
            NavigationStack {
                Form {
                    Section {
                        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                        
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2 ..< 21) {
                                Text("\($0) people")
                            }
                        }
                    }
                    
                    Section("How much tip do you want to leave?") {
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(tipPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                        Text(total.checkAmountPlusTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .pickerStyle(.segmented)
                    }
                    
                    Section("Amount per person") {
                        Text(total.totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
                
                .navigationTitle("WeSplit")
                .toolbar {
                    if amountIsFocused {
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


