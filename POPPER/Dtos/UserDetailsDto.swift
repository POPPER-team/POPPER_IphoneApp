//
//  UserDetailsDto.swift
//  POPPER
//
//  Created by Matija Lukanić on 29.04.2024..
//

import Foundation

struct UserDetailsDto: Codable {
    let username: String
    let guid: String
    let email: String
    let firstName: String
    let lastName: String
    let dateOfBirth: String
    let status: String
    let webLink: String
    let preferredUnits: String
    let language: String
}

