//
//  UserDetailsDto.swift
//  POPPER
//
//  Created by Matija Lukanić on 29.04.2024..
//

import Foundation

struct UserDetailsDto: Codable {
    var username: String
    var guid: String
    var email: String?
    var firstName: String
    var lastName: String
    var created: String
    var dateOfBirth: String?
    var status: String?
    var webLink: String?
    var preferredUnits: String?
    var language: String?
}

