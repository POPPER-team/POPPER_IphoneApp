//
//  DemoApp.swift
//  Demo
//
//  Created by Matija Lukanić on 20.03.2024..
//

import SwiftUI

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
        WindowGroup {
            MainTabView()
        }
    }
}
