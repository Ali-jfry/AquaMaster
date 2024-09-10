//
//  AddTaskView.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 10/9/2024.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var taskViewModel : TaskViewModel
    @State var selectDate = Date()
    @State var taskTitle = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Form{
                Spacer()
                DatePicker(selection: $selectDate){
                    Text("Date and time")
                }
                TextField("Task title", text: $taskTitle)
     
            }
            .padding(.top, 40)
            Spacer()
            Button{
                let newtask = AquariumTask(id: UUID(), title: taskTitle, date: selectDate)
                taskViewModel.addTask(newtask)
                dismiss()
            }label: {
                Text("Add Task")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
         
            
        }
        
    }
}

#Preview {
    AddTaskView()
        .environmentObject(TaskViewModel())
}
