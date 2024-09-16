//
//  AddTaskView.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 10/9/2024.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State private var selectDate = Date()
    @State private var taskTitle = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                Text("Add New Task")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("primaryColor"))
                    .padding(.top)
                
                Spacer()
                
                // Form Fields
                VStack(spacing: 20) {
                    // Task Title Input
                    TextField("Task Title", text: $taskTitle)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                        .shadow(radius: 1)
                        .padding(.horizontal)
                    
                    // Date Picker
                    DatePicker("Date and Time", selection: $selectDate, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .padding(.horizontal)
                }
                .padding(.vertical)
                
                Spacer()
                
                // Add Task Button
                Button(action: {
                    let newTask = AquariumTask(id: UUID(), title: taskTitle, date: selectDate)
                    taskViewModel.addTask(newTask)
                    dismiss()
                }) {
                    Text("Add Task")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("primaryColor"))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                }
                .padding(.bottom)
                .disabled(taskTitle.isEmpty) // Disable button if task title is empty
                .opacity(taskTitle.isEmpty ? 0.6 : 1.0) // Adjust opacity when disabled
                
                // Cancel Button
                Button(action: {
                    dismiss()
                }) {
                    Text("Cancel")
                        .font(.headline)
                        .foregroundColor(Color("primaryColor"))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("secondaryColor"))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                }
                .padding(.bottom)
            }
            .navigationBarHidden(true)
            
        }
    }
}

#Preview {
    AddTaskView()
        .environmentObject(TaskViewModel())
}
