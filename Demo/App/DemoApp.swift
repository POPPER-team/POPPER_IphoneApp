//
//  DemoApp.swift
//  Demo
//
//  Created by Matija Lukanić on 20.03.2024..
//

import SwiftUI

@main
struct DemoApp: App {
    @State private var isUserLoggedIn = false
    var body: some Scene {

        WindowGroup {
            if isUserLoggedIn {
                MainTabView()
            } else {
                LoginView(authenticateUser: authUser)
            }
        }
        
    }
    
    public func authUser() {
        isUserLoggedIn.toggle()
    }
    
}
