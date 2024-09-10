//
//  TaskRow.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 10/9/2024.
//

import SwiftUI

struct TaskRow: View {
    let task : AquariumTask
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(task.title)
                Text(task.date.formatted(date: .abbreviated,
                                         time: .shortened))
            }
            Spacer()
            Button{
                
            }label: {
                Text("Edit")
            }
            .buttonStyle(.bordered)
            
        }
        .padding()
    }
}

#Preview {
    TaskRow(task: AquariumTask(id: UUID(), title: "Change water", date: Date()))
}
