//
//  WaterQualityViewModel.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 16/9/2024.
//

import Foundation

class WaterQualityViewModel: ObservableObject {
    @Published var waterQualityData: [WaterQualityModel] = [
        WaterQualityModel(parameter: "pH", value: 7.2, status: .good),
        WaterQualityModel(parameter: "Temperature", value: 28.0, status: .warning),
        WaterQualityModel(parameter: "Ammonia", value: 0.25, status: .good),
        WaterQualityModel(parameter: "Nitrates", value: 15.0, status: .good)
    ]
    
    // Overall water quality based on the worst status
    var overallStatus: WaterQualityStatus {
        if waterQualityData.contains(where: { $0.status == .critical }) {
            return .critical
        } else if waterQualityData.contains(where: { $0.status == .warning }) {
            return .warning
        } else {
            return .good
        }
    }
}
