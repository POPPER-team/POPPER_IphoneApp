//
//  UserViewModel.swift
//  POPPER
//
//  Created by Matija Lukanić on 02.06.2024..
//

import Foundation
import Combine
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    @Published var users: [UserIdentifiable] = [
        UserIdentifiable(id: 1, username: "User1", guid: "1", email: "user1@users.com", firstName: "User", lastName: "1"),
        UserIdentifiable(id: 2, username: "User2", guid: "2", email: "user2@users.com", firstName: "User", lastName: "2"),
        UserIdentifiable(id: 3, username: "User3", guid: "3", email: "user3@users.com", firstName: "User", lastName: "3")
    ]

    var filteredUsers: [UserIdentifiable] {
        if searchQuery.isEmpty {
            return users
        } else {
            return users.filter { $0.username.lowercased().contains(searchQuery.lowercased()) }
        }
    }

    func toggleSelection(for user: UserIdentifiable) {
        if let index = users.firstIndex(where: { $0.id == user.id }) {
            users[index].isSelected.toggle()
        }
    }
}

