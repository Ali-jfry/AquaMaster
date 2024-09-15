//
//  TaskView.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 10/9/2024.
//

import SwiftUI

struct TaskView: View {
//
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State var addTaskViewPresented: Bool = false
    var body: some View {
            HStack{
                List{
                    ForEach(taskViewModel.taskLists){ task in
                        TaskRow(task: task)
                            .swipeActions {
                                Button(role: .destructive) {
                                    taskViewModel.delete(task)
                                } label: {
                                    Image(systemName: "trash")
                                }
                            }
                    }
                }
            }
        
        .navigationTitle("Task Lists")
        .toolbar{
            // Leading toolbar item for the settings button
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    addTaskViewPresented = true
                    
                }) {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.medium)
                        
                }
            }
        }
        .sheet(isPresented: $addTaskViewPresented)  {
            AddTaskView()
        }
        
    }
}

#Preview {
    TaskView()
        .environmentObject(TaskViewModel())
}
