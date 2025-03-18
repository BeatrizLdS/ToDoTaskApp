//
//  ListTaskView.swift
//  ToDoTaskApp
//
//  Created by Beatriz Leonel on 13/03/25.
//

import SwiftUI
import SwiftData

struct ListTaskView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var tasks: [TaskModel]
    
    @State var addTask: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(tasks) { task in
                        TaskView(task: task)
                            .swipeActions(allowsFullSwipe: false) {
                                deleteTask(task)
                                viewTask(task)
                            }
                    }
                } header: {
                    Text("Tasks")
                } footer: {
                    Text("TOTAL: \(tasks.count)")
                }
            }
            .listStyle(.insetGrouped)
            .sheet(isPresented: $addTask) {
                AddTaskView()
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        addTask.toggle()
                    } label: {
                        Label {
                            Text("Add Task")
                        } icon: {
                            Image(systemName: "plus")
                        }

                    }
                }
            }
            .navigationTitle("Tasks List")
        }
    }
    
    func deleteTask(_ task: TaskModel) -> some View {
        Button(role: .destructive) {
//            tasks.removeAll { currentTask in
//                currentTask.id == task.id
//            }
            modelContext.delete(task)
        } label: {
            Label {
                Text("Delete")
            } icon: {
                Image(systemName: "trash")
            }

        }
    }
    
    func viewTask(_ task: TaskModel) -> some View {
        NavigationLink {
            DetailsTask(item: task)
        } label: {
            Image(systemName: "eye")
        }
    }
}

#Preview {
    ListTaskView()
}
