//
//  User.swift
//  SwiftDataProject
//
//  Created by Marcos Barbosa on 25/12/23.
//

import SwiftUI
import SwiftData

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date

    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
