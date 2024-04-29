//
//  NewUserDto.swift
//  POPPER
//
//  Created by Matija Lukanić on 29.04.2024..
//

import Foundation

struct NewUserDto: Codable {
    let username: String
    let password: String
    let email: String
    let firstName: String
    let lastName: String
    let dateOfBirth: String
}
