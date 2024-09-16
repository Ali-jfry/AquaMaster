//
//  TaskView.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 10/9/2024.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State var addTaskViewPresented: Bool = false

    var body: some View {
        ZStack {
            // Background Color
            Color("secondaryColor")
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                // Header
                HStack{
                    Text("Task List")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("primaryColor"))
                        .padding(.top)
                    Spacer()
                    Button(action: {
                                addTaskViewPresented = true
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color("primaryColor"))
                                    
                        }
                            .padding()
                            .accessibilityLabel("Add Task")
                }
                .padding([.horizontal, .top])

                // Task List
                List {
                    ForEach(taskViewModel.taskLists) { task in
                        TaskRow(task: task)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                    taskViewModel.delete(task)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                            .listRowBackground(Color.clear) // Make row background transparent
                            .listRowSeparator(.hidden)      // Hide separators between rows
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .scrollContentBackground(.hidden) // Hide default background
                .background(Color("primaryColor"))
                .cornerRadius(12)
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top)

            // Floating Add Task Button
            
        }
        .sheet(isPresented: $addTaskViewPresented) {
            AddTaskView()
                .environmentObject(taskViewModel)
        }
    }
}

#Preview {
    NavigationView {
        TaskView()
            .environmentObject(TaskViewModel())
    }
}
