//
//  AddTaskView.swift
//  ToDoTaskApp
//
//  Created by Beatriz Leonel on 13/03/25.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var taskName: String = ""
    @State var taskDate: Date = Date()
    
    @Binding var tasks: [TaskModel]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Task Name", text: $taskName)
                DatePicker("Task Date", selection: $taskDate)
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        let newTask = TaskModel(
                            title: taskName,
                            date: taskDate
                        )
                        tasks.append(newTask)
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
            }
            .navigationTitle("Add Task")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    @Previewable @State var tasks: [TaskModel] = []
    AddTaskView(tasks: $tasks)
}
