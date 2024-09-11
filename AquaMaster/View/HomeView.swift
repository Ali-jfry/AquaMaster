//
//  HomeView.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 10/9/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var isLightOn = false

    var body: some View {
        VStack{
            Text("AquaMaster")
                .font(.largeTitle)
            
            HStack{
                VStack{
                    Text("Water Quality")
                        .padding()
                    Image(systemName: "circle")
                        .imageScale(.large)
                        .background(Circle().fill(Color.green))
                }
                .padding(.leading, 16)
                Spacer()
                VStack{
                    Text("Feed log")
                        .padding()
                    Text("12/12/24-12:00")
                }
                .padding(.trailing, 16)
           
            }
            .padding()
            
            Image(systemName: isLightOn ? "sun.max.fill" : "moon.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(isLightOn ? .yellow : .gray)
                            .animation(.easeInOut, value: isLightOn)
                        
                        // Toggle button for the light
                        Button(action: {
                            isLightOn.toggle()
                        }) {
                            Text(isLightOn ? "Turn Off Light" : "Turn On Light")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(isLightOn ? Color.yellow : Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
        }
        .toolbar {
            // Leading toolbar item for the settings button
            ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                            .font(.system(size: 24))
                            .padding(.leading, 16)
                    }
            }
            
            
            // Trailing toolbar item for the person button
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // Action for profile
                }) {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 24))
                        .padding(.trailing, 16)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
