//
//  HomeView.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 10/9/2024.
//
import SwiftUI

struct HomeView: View {
    @State private var isLightOn = false
    @ObservedObject var feedLogViewModel = FeedLogViewModel()
    @State var feedLogPresent : Bool = false
    var primaryColor: Color {
        Color(red: 92/255.0, green: 42/255.0, blue: 85/255.0)
    }
    var body: some View {
        ZStack {
            // Background image
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea() // Ensure the image covers the entire screen
                .opacity(0.6)
                .blur(radius: 6)
            VStack {
                Text("AquaMaster")
                    .font(.largeTitle)
                    .foregroundColor(primaryColor)// Change text color for visibility
                
                HStack {
                    VStack {
                        Text("Water Quality")
                            .padding()
                            .foregroundColor(.white) // Change text color for visibility
                        Image(systemName: "circle")
                            .imageScale(.large)
                            .background(Circle().fill(Color.green))
                    }
                    .padding(.leading, 16)

                   
                    
                    VStack {
                        Text("Today's Feed Log")
                            .font(.headline)
                            .foregroundColor(.white) // Change text color for visibility
                        
                        Button(action: {
                            // Action for editing feed log
                            feedLogPresent.toggle()
                        }) {
                            HStack {
                                Text(feedLogViewModel.todaysDate())
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                
                                Image(systemName: "pencil")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                            }
                            .padding() // Add padding inside the button
                            .background(Color.white) // Button background for visibility
                            .cornerRadius(8)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(red: 92/255.0, green: 42/255.0, blue: 85/255.0))
                    )

                    
                    .padding(.trailing, 16)
                }
                .padding(.top, 16) // Optional: Add some top padding
                .padding(.bottom, 8) // Adjust bottom padding to minimize space
                
                Spacer()
                
                Image(systemName: isLightOn ? "sun.max.fill" : "moon.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(isLightOn ? .yellow : Color(red: 92/255.0, green: 42/255.0, blue: 85/255.0))
                    .animation(.easeInOut, value: isLightOn)
                    .padding(.bottom, 60) // Adjust bottom padding
                
                // Toggle button for the light
                Button(action: {
                    isLightOn.toggle()
                }) {
                    Text(isLightOn ? "Turn Off Light" : "Turn On Light")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isLightOn ? Color.yellow : Color(red: 92/255.0, green: 42/255.0, blue: 85/255.0))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 80)
                .padding(.bottom, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center) // Center the VStack
            .padding(.horizontal, 0) // No horizontal padding to ensure centering
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
            .sheet(isPresented: $feedLogPresent) {
                DailyFeedLogView()
            }
        }
    }
}

#Preview {
    HomeView()
}

