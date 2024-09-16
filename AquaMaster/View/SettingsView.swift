//
//  SettingsView.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 10/9/2024.
//

import SwiftUI

struct SettingsView: View {
    
    var secondaryColor: Color {
        Color(red: 125 / 255.0, green: 184 / 255.0, blue: 248 / 255.0)
    }
    
    var primaryColor: Color {
        Color(red: 92 / 255.0, green: 42 / 255.0, blue: 85 / 255.0)
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView { // Wrap in NavigationView
            ZStack {
                Image("settings_background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea() // Ensure the image covers the entire screen
                
                Color.black.opacity(0.5) // Dark overlay with 60% opacity
                    .ignoresSafeArea()
                
                VStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(secondaryColor)
                    
                    Text("User Name")
                        .font(.title3)
                        .foregroundColor(secondaryColor)
                        .padding(.top, 10)
                    
                    NavigationLink(destination: UpdateDetailsView()) {
                        Text("Update Details")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(secondaryColor)
                            .foregroundColor(primaryColor)
                            .cornerRadius(18)
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 50)
                    
                    Button {
                        // Action for changing theme
                    } label: {
                        Text("Change Theme")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(secondaryColor)
                            .foregroundColor(primaryColor)
                            .cornerRadius(18)
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 10)
                    
                    Button {
                        // Action for connected device
                    } label: {
                        Text("Connected Device (2)")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(secondaryColor)
                            .foregroundColor(primaryColor)
                            .cornerRadius(18)
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 10)
                    
                    Button {
                        // Action for logging out
                    } label: {
                        Text("Log out")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(secondaryColor)
                            .foregroundColor(primaryColor)
                            .cornerRadius(18)
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 10)
                    
                    
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                           
                            dismiss() // Action for return home
                        }) {
                            Text("Back")
                                .font(.system(size: 20))
                                .foregroundColor(Color("primaryColor"))
                                .frame(width: 100, height: 40, alignment: .center)
                                .background(Color("secondaryColor"))
                                .cornerRadius(12)
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
