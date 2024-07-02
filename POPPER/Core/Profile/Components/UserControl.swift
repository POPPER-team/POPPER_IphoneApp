//
//  UserControl.swift
//  POPPER
//
//  Created by Matija Lukanić on 29.05.2024..
//

import Foundation

class UserControl : ObservableObject{
    
    @Published public var user: UserDetailsDto? = nil
    
    public func setUser(userDetails: UserDetailsDto) {
        self.user = userDetails
    }
}
