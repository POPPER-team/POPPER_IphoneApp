//
//  UserControl.swift
//  POPPER
//
//  Created by Matija Lukanić on 29.05.2024..
//

import Foundation

struct UserControl {
    private static var user: UserDetailsDto?
    
    public static func setUser(userDetails: UserDetailsDto) {
        user = userDetails
    }
    
    public static func getUser() -> UserDetailsDto? {
        return user
    }
    
    public static func clearUser() {
        user = nil
    }
}
