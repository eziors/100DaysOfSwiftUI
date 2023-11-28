//
//  Mission.swift
//  Moonshot
//
//  Created by Marcos Barbosa on 27/11/23.
//

import Foundation



struct Mission: Codable, Identifiable {
    struct CreRole: Codable {
        let name: String
        let role: String
    }
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
    
}
