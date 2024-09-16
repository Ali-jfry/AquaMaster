//
//  User.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 16/9/2024.
//

import Foundation

class User: Codable {
    var username: String
    var password: String 

    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
