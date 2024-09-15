//
//  ContentView.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 4/9/2024.
//

import SwiftUI

struct ContentView: View {
  
    @EnvironmentObject var taskViewModel : TaskViewModel
    @State var selectionTab : Int = 1
    var body: some View {
            
        
            TabView (selection: $selectionTab) {
                NavigationView{
                    HomeView()
                }
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
                .tag(1)
                NavigationView{
                    TaskView()
                }
                .tabItem {
                    VStack {
                        Image(systemName: "clipboard")
                        Text("Task")
                    }
                }
                .tag(2)
                
                Text("Profile view")
                    .tabItem {
                        VStack {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                    }
                    
                    
                }
                
            }                  
            
          
//            .padding()
        }
//        .toolbarBackground(Color.green)



#Preview {
    ContentView()
        .environmentObject(TaskViewModel())
}
