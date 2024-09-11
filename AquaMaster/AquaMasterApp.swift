//
//  AquaMasterApp.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 4/9/2024.
//

import SwiftUI

@main
struct AquaMasterApp: App {
    @StateObject var taskViewModel = TaskViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taskViewModel)
            
        }
    }
}
