//
//  ContentView.swift
//  Moonshot
//
//  Created by Marcos Barbosa on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        
        Text(String(astronauts.count))
    }
}

#Preview {
    ContentView()
}
