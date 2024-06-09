//
//  NewUserDto.swift
//  POPPER
//
//  Created by Matija Lukanić on 29.04.2024..
//

import Foundation

struct NewUserDto: Codable {
    var username: String
    var password: String
    var firstName: String
    var lastName: String
}
