//
//  DemoApp.swift
//  Demo
//
//  Created by Matija Lukanić on 20.03.2024..
//

import SwiftUI

@main
struct PopperApp: App {
    @State private var user: Bool = false
    var body: some Scene {

        WindowGroup {
            if user {
                MainTabView()
            } else {
                LoginView(authenticateUser: {
                    user.toggle()
                }
    )
            }
        }
        
    }
    
}
