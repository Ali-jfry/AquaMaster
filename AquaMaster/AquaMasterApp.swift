//
//  AquaMasterApp.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 4/9/2024.
//

import SwiftUI

@main
struct AquaMasterApp: App {
    @StateObject private var loginViewModel = LoginViewModel()
    @StateObject private var taskViewModel = TaskViewModel()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(loginViewModel)
                .environmentObject(taskViewModel)
        }
    }
}
