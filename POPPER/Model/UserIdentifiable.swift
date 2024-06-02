//
//  UserIdentifiable.swift
//  POPPER
//
//  Created by Matija Lukanić on 02.06.2024..
//

import Foundation

struct UserIdentifiable : Identifiable{
    var id: Int
    let username: String
    let guid: String
    let email: String
    let firstName: String
    let lastName: String
    var isSelected: Bool = false
}
