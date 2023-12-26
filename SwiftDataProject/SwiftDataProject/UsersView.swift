//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Marcos Barbosa on 25/12/23.
//


import SwiftData
import SwiftUI

struct UsersView: View {
    @Query var users: [User]

    var body: some View {
        List(users) { user in
            VStack(alignment: .leading) {
                Text(user.name)
                Text(user.joinDate.formatted(date: .abbreviated, time: .omitted))
                    .font(.headline)
            }

        }
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User>{ user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    

}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
