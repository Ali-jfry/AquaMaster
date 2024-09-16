//
//  UserViewModel.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 16/9/2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String = ""

    private let userDefaultsKey = "storedUser"

    init() {
        // Automatically attempt login if credentials are already stored
        if let user = retrieveUser() {
            username = user.username
            password = user.password
            isAuthenticated = true
        }
    }

    func login() {
        guard !username.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter both username and password."
            return
        }

        if let storedUser = retrieveUser() {
            if storedUser.username == username && storedUser.password == password {
                isAuthenticated = true
                errorMessage = ""
            } else {
                errorMessage = "Invalid credentials. Please try again."
            }
        } else {
            errorMessage = "No user found. Please sign up."
        }
    }

    func signUp() {
        guard !username.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter both username and password."
            return
        }

        let newUser = User(username: username, password: password)
        saveUser(user: newUser)
        isAuthenticated = true
        errorMessage = ""
    }

    private func saveUser(user: User) {
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }

    private func retrieveUser() -> User? {
        if let savedUserData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let savedUser = try? JSONDecoder().decode(User.self, from: savedUserData) {
            return savedUser
        }
        return nil
    }

    func logout() {
        isAuthenticated = false
        username = ""
        password = ""
    }
}
