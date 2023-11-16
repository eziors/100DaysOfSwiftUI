//
//  ContentView.swift
//  Animations
//
//  Created by Marcos Barbosa on 09/11/23.
//

import SwiftUI



struct ContentView: View {
    
    @State private var animationAmount = 1.0
    @State private var enabled = false
    
    var body: some View {
        
        Button("Tap me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .foregroundStyle(.white)
        .background(enabled ? .blue : .red)
        .animation(.default, value: enabled)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
    }
}


#Preview {
    ContentView()
}
