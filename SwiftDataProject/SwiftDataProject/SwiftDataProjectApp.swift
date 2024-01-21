//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Marcos Barbosa on 25/12/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
