//
//  TaskRow.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 10/9/2024.
//

import SwiftUI

struct TaskRow: View {
    let task: AquariumTask
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State private var isEditing = false

    var body: some View {
        HStack {
            // Task Icon (Optional)
            Image(systemName: "calendar.circle.fill")
                .font(.title)
                .foregroundColor(Color("secondaryColor"))
                .padding(.trailing, 10)
            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .font(.headline)
                    .foregroundColor(Color("secondaryColor"))

                Text(task.date.formatted(date: .abbreviated, time: .shortened))
                    .font(.subheadline)
                    .foregroundColor(Color("secondaryColor"))
            }

            Spacer()

            // Edit Button
            Button(action: {
                isEditing = true
            }) {
                Image(systemName: "pencil.circle.fill")
                    .font(.title)
                    .foregroundColor(.yellow)
                    
            }
            .buttonStyle(PlainButtonStyle())
            .sheet(isPresented: $isEditing) {
                EditTaskView(selectDate: task.date, taskTitle: task.title, taskId: task.id)
                    .environmentObject(taskViewModel)
            }
        }
        .padding(.vertical, 8)
        .contentShape(Rectangle()) // Make entire row tappable
        .onTapGesture {
            isEditing = true
        }
    }
}

#Preview {
    TaskRow(task: AquariumTask(id: UUID(), title: "Change water", date: Date()))
        .environmentObject(TaskViewModel())
}
