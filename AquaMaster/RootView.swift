//
//  RootView.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 16/9/2024.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel

    var body: some View {
        if loginViewModel.isAuthenticated {
            ContentView()
                .environmentObject(loginViewModel)
        } else {
            LoginView()
                .environmentObject(loginViewModel)
        }
    }
}
