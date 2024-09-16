//
//  FeedLogViewModel.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 11/9/2024.
//

import Foundation

class FeedLogViewModel: ObservableObject {
    @Published var feedLogs: [FeedLog]
    
    init() {
        self.feedLogs = Self.loadFeedLogs() ?? FeedLog.sampleLogs
    }
    
    // Toggle the fed status
    func toggleFed(for log: FeedLog) {
        if let index = feedLogs.firstIndex(where: { $0.id == log.id }) {
            feedLogs[index].isFed.toggle()
            saveFeedLogs()
        }
    }
    
    // Save the feed logs
    func saveFeedLogs() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(feedLogs) {
            UserDefaults.standard.set(encoded, forKey: "feedLogs")
        }
    }
    
    // Load saved feed logs
    static func loadFeedLogs() -> [FeedLog]? {
        if let savedData = UserDefaults.standard.data(forKey: "feedLogs") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([FeedLog].self, from: savedData) {
                return decoded
            }
        }
        return nil
    }
    func todaysDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium 
        return dateFormatter.string(from: Date())
    }
     func completedFeedings() -> Double {
        return Double(feedLogs.filter { $0.isFed }.count)
    }
    
    // Reset all feed logs for the day
     func resetFeedLog() {
        for index in feedLogs.indices {
            feedLogs[index].isFed = false
        }
        saveFeedLogs()
    }
}
