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
    
    // Function to perform login
    func login(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        // Here you would typically make a network request to your server to authenticate the user
        // For demonstration purposes, let's assume successful login with dummy data
        
        // Replace this with your actual login implementation
        let user = User(username: username, password: password) // Create a user object
        self.currentUser = user // Set the current user
        
        completion(.success(user))
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
