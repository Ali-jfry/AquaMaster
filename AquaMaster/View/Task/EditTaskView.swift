//
//  AddTaskView.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 10/9/2024.
//

import SwiftUI

struct EditTaskView: View {
    @EnvironmentObject var taskViewModel : TaskViewModel
    @State var selectDate : Date
    @State var taskTitle : String
    var taskId : UUID
    
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
                let upadateTask = AquariumTask(id: taskId, title: taskTitle, date: selectDate)
                taskViewModel.update(upadateTask)
                dismiss()
            }label: {
                Text("Update")
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
    EditTaskView(selectDate: Date(), taskTitle: "Sample Task", taskId: UUID())
        .environmentObject(TaskViewModel())
}
