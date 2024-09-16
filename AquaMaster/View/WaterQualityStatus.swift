//
//  WaterQualityStatus.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 16/9/2024.
//

import SwiftUI

enum WaterQualityStatus: String {
    case good = "Good"
    case warning = "Warning"
    case critical = "Critical"
    
    // Computed property for color
    var color: Color {
        switch self {
        case .good:
            return .green
        case .warning:
            return .yellow
        case .critical:
            return .red
        }
    }
    
    // Computed property for icon name
    var iconName: String {
        switch self {
        case .good:
            return "checkmark.circle.fill"
        case .warning:
            return "exclamationmark.triangle.fill"
        case .critical:
            return "xmark.circle.fill"
        }
    }
}

