
//
//  Task.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 10/9/2024.
//

import Foundation

struct AquariumTask: Identifiable, Decodable {
    var id: UUID
    var title: String
    var date: Date
    
    init(id: UUID, title: String, date: Date) {
        self.id = id
        self.title = title
        self.date = date
    }
    
    static var sampleTasks: [AquariumTask] {
        return [
            AquariumTask(id: UUID(), title: "Change water", date: Date()),
            AquariumTask(id: UUID(), title: "Feed the fish", date: Date())

        ]
    }
}

