//
//  WaterQualityView.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 16/9/2024.
//
import SwiftUI

struct WaterQualityView: View {
    @StateObject private var viewModel = WaterQualityViewModel()
    
    var primaryColor: Color {
        Color(red: 92 / 255.0, green: 42 / 255.0, blue: 85 / 255.0)
    }
    var secondaryColor: Color {
        Color(red: 125 / 255.0, green: 184 / 255.0, blue: 248 / 255.0)
    }
    
    var body: some View {
        VStack(spacing: 16) {
            // Overall Water Quality Summary
            HStack {
                Text("Overall Water Quality: \(viewModel.overallStatus.rawValue)")
                    .font(.title3)
                    .bold()
                    .foregroundColor(viewModel.overallStatus.color) // Enum's computed property
                
                Spacer()
                
                Image(systemName: viewModel.overallStatus.iconName) // Enum's computed property
                    .foregroundColor(viewModel.overallStatus.color)
                    .font(.largeTitle)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(viewModel.overallStatus == .critical ? secondaryColor : primaryColor
                    )
            )
            
            
            // Water Quality Details
            ForEach(viewModel.waterQualityData, id: \.parameter) { data in
                HStack {
                    Text(data.parameter)
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("\(data.value, specifier: "%.2f")")
                        .foregroundColor(.gray)
                        .font(.headline)
                    
                    Image(systemName: data.status.iconName)
                        .foregroundColor(data.status.color)
                        
                       
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor.systemGray6)))

            }
            
            Spacer()
        }
        .padding()
        .background(viewModel.overallStatus == .critical ? Color(primaryColor) : Color( secondaryColor)
        )
    }
}

#Preview {
    WaterQualityView()
}
