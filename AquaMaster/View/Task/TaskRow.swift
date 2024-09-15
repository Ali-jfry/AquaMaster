//
//  TaskRow.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 10/9/2024.
//

import SwiftUI

import SwiftUI

struct TaskRow: View {
    let task: AquariumTask
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State private var isEditing = false

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title)
                Text(task.date.formatted(date: .abbreviated, time: .shortened))
            }
            Spacer()
            Button {
                isEditing = true
            } label: {
                Text("Edit")
            }
            .buttonStyle(.bordered)
            .sheet(isPresented: $isEditing) {
                EditTaskView(selectDate: task.date, taskTitle: task.title, taskId: task.id)
                    .environmentObject(taskViewModel) // Pass the environment object
            }
        }
        .padding()
    }
}

#Preview {
    TaskRow(task: AquariumTask(id: UUID(), title: "Change water", date: Date()))
        .environmentObject(TaskViewModel()) // Provide the environment object for preview
}
