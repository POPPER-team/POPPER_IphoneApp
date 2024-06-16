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
    @Published var users: [UserDto] = []

    var filteredUsers: [UserDto] {
        if searchQuery.isEmpty {
            return users
        } else {
            return users.filter { $0.username.lowercased().contains(searchQuery.lowercased()) }
        }
    }

    //func toggleSelection(for user: UserDto) {
        //if let index = users.firstIndex(where: { $0.id == user.id }) {
            //users[index].isSelected.toggle()
        //}
    //}
}
