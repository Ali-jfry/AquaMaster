//
//  FeedLogModel.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 11/9/2024.
//

import Foundation


struct FeedLog: Identifiable, Codable {
    var id = UUID()
    var time: String   // e.g., "8:00 AM"
    var isFed: Bool    // True if the fish were fed at this time
    
    // Example feed log times
    static let sampleLogs: [FeedLog] = [
        FeedLog(time: "8:00 AM", isFed: false),
        FeedLog(time: "6:00 PM", isFed: false)
    ]
}
