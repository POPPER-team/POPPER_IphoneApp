//
//  TokensDto.swift
//  POPPER
//
//  Created by Matija Lukanić on 29.04.2024..
//

import Foundation

struct TokensDto : Decodable{
    var jwtToken: String
    var refreshToken: String
}
