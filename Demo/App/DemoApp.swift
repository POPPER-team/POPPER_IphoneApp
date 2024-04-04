//
//  DemoApp.swift
//  Demo
//
//  Created by Matija Lukanić on 20.03.2024..
//

import SwiftUI

@main
struct DemoApp: App {
    @State private var userLoggedIn = false
    var body: some Scene {

        WindowGroup {
            if userLoggedIn {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}
