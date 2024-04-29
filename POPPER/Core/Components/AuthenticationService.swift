//
//  AuthenticationService.swift
//  POPPER
//
//  Created by Matija Lukanić on 29.04.2024..
//

import Foundation

class AuthenticationService {
    
    // Singleton instance
    static let shared = AuthenticationService()
    
    // Current user session
    private var currentUser: User?
    
    // Private initializer to prevent instantiation outside the class
    private init() {}
    
    func setUser(user: User) {
        self.currentUser = user
    }
    
    // Function to perform logout
    func logout() {
        // Perform any necessary cleanup tasks here, such as clearing user session data
        self.currentUser = nil
    }
    
    // Function to check if a user is logged in
    func isLoggedIn() -> Bool {
        return currentUser != nil
    }
    
    // Function to get the current user
    func getCurrentUser() -> User? {
        return currentUser
    }
}
