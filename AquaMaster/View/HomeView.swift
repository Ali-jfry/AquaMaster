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
    @State var feedLogPresent: Bool = false
    @State private var showSettings: Bool = false
    @StateObject private var waterQualityViewModel = WaterQualityViewModel()
    @State var showWaterQualityView : Bool = false
    var primaryColor: Color {
        Color(red: 92 / 255.0, green: 42 / 255.0, blue: 85 / 255.0)
    }
    var secondaryColor: Color {
        Color(red: 125 / 255.0, green: 184 / 255.0, blue: 248 / 255.0)
    }

    var body: some View {
        ZStack {
            // Background image
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.6)
                .blur(radius: 6)

            VStack {
                Text("AquaMaster")
                    .font(.largeTitle)
                    .foregroundColor(primaryColor)

                HStack {
                    // Water Quality Section
                    VStack {
                        Text("Water Quality")
                            .font(.headline)
                            .foregroundColor(                                waterQualityViewModel.overallStatus == .critical ? primaryColor : secondaryColor
                            )
                       
                        

                        HStack(spacing: 4) {
                            Text(waterQualityViewModel.overallStatus.rawValue)
                                .font(.title2)
                                .foregroundColor(waterQualityViewModel.overallStatus.color)

                            Image(systemName: waterQualityViewModel.overallStatus.iconName)
                                .foregroundColor(waterQualityViewModel.overallStatus.color)
                                .font(.title2)
                        }
                    }
                    .padding()
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(                                waterQualityViewModel.overallStatus == .critical ? secondaryColor : primaryColor
                                 )
                            .shadow(color: .black.opacity(0.4), radius: 2, x: 0, y: 4)
                    )

                    .onTapGesture{
                        showWaterQualityView.toggle()
                    }
                    .sheet(isPresented: $showWaterQualityView){
                        WaterQualityView()
                    }
                    


                    // Today's Feed Log Section
                    VStack {
                        Text("Today's Feed Log")
                            .font(.headline)
                            .foregroundColor(Color("secondaryColor"))

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
                                    .foregroundColor(.black)
                            }
                            .padding()
                            .background(Color("secondaryColor"))
                            .cornerRadius(8)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(primaryColor)
                    )
                    .padding(.trailing, 16)
                }
                .padding(.top, 16)
                .padding(.bottom, 8)

                Spacer()

                // Light Control Section
                Image(systemName: isLightOn ? "sun.max.fill" : "moon.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(isLightOn ? .yellow : primaryColor)
                    .animation(.easeInOut, value: isLightOn)
                    .padding(.bottom, 60)

                Button(action: {
                    isLightOn.toggle()
                }) {
                    Text(isLightOn ? "Turn Off Light" : "Turn On Light")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isLightOn ? Color.yellow : primaryColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 80)
                .padding(.bottom, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .padding(.horizontal, 0)
            .toolbar {
                // Leading toolbar item for the settings button
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showSettings.toggle()
                    }) {
                        Image(systemName: "gearshape")
                            .font(.system(size: 24))
                            .padding(.leading, 16)
                            .foregroundColor(primaryColor)
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
                            .foregroundColor(primaryColor)
                    }
                }
            }
            .sheet(isPresented: $feedLogPresent) {
                DailyFeedLogView()
            }
            .fullScreenCover(isPresented: $showSettings) {
                SettingsView()
            }
        }
    }
}

#Preview {
    HomeView()
}
