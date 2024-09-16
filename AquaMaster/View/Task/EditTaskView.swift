//
//  AddTaskView.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 10/9/2024.
//

import SwiftUI

struct EditTaskView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State  var selectDate: Date
    @State  var taskTitle: String
    var taskId: UUID

    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            // Background Color
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)

            VStack {
                // Header
                Text("Edit Task")
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

                // Update Task Button
                Button(action: {
                    let updatedTask = AquariumTask(id: taskId, title: taskTitle, date: selectDate)
                    taskViewModel.update(updatedTask)
                    dismiss()
                }) {
                    Text("Update Task")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("primaryColor"))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .shadow(radius: 4)
                }
                .padding(.bottom)
                .disabled(taskTitle.isEmpty)
                .opacity(taskTitle.isEmpty ? 0.6 : 1.0)

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
                        .shadow(radius: 1)
                }
                .padding(.bottom)
            }
        }
    }
}

#Preview {
    EditTaskView(selectDate: Date(), taskTitle: "Sample Task", taskId: UUID())
        .environmentObject(TaskViewModel())
}
