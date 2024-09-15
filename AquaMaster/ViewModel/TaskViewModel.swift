//
//  TaskLists.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 10/9/2024.
//

import Foundation

class TaskViewModel: ObservableObject{
    @Published var taskLists = [AquariumTask]()
    
    init(){
        fetchTasks()
    }
    
    func fetchTasks(){
        taskLists = AquariumTask.sampleTasks
    }
    func delete(_ task: AquariumTask){
        if let index = taskLists.firstIndex(where: {$0.id == task.id}) {
            taskLists.remove(at: index)
        }
    }
    func addTask(_ task: AquariumTask){
        taskLists.append(task)
    }
    func update(_ task: AquariumTask) {
        if let index = taskLists.firstIndex(where: {$0.id == task.id}) {
                taskLists[index].date = task.date
                taskLists[index].title = task.title
                
        }
    }
    
    
}
