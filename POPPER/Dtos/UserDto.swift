//
//  UserDto.swift
//  POPPER
//
//  Created by Matija Lukanić on 29.04.2024..
//

import Foundation

struct UserDto: Codable {
    let username: String
    let guid: String
    let email: String?
    let firstName: String
    let lastName: String
}

