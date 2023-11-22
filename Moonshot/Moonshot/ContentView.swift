//
//  ContentView.swift
//  Moonshot
//
//  Created by Marcos Barbosa on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        
        Text(String(astronauts.count))
    }
}

#Preview {
    ContentView()
}
