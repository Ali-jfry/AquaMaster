//
//  ContentView.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 4/9/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var   lightOnTime = Date()
    @State private var lightOffTime = Date()
    
    
    var body: some View {
        NavigationView {
            
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
                
                
                
                TabView {
                    Text("Home view")
                        .tabItem {
                            VStack {
                                Image(systemName: "house")
                                Text("Home")
                            }
                        }
                    Text("Task view")
                        .tabItem {
                            VStack {
                                Image(systemName: "pencil")
                                Text("Task")
                            }
                        }
                    Text("Profile view")
                        .tabItem {
                            VStack {
                                Image(systemName: "person")
                                Text("Profile")
                            }
                        }
                }
                
            }
                       
            .toolbar {
                // Leading toolbar item for the settings button
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Action for settings
                    }) {
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
          
//            .padding()
        }
//        .toolbarBackground(Color.green)
    }
}

#Preview {
    ContentView()
}
