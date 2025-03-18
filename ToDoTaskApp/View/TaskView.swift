//
//  ContentView.swift
//  ToDoTaskApp
//
//  Created by Beatriz Leonel on 12/03/25.
//

import SwiftUI

struct TaskView: View {
    var task: TaskModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title)
                
                HStack {
                    HStack {
                        Image(systemName: "calendar")
                        Text("Data")
                        Text(getDate(task))
                    }
                    
                    HStack {
                        Image(systemName: "clock")
                        Text("Hora")
                        Text(getHour(task))
                    }
                }
            }
            
            Spacer()
            
            Button {
                task.isDone.toggle()
            } label: {
                Label {
                    Text("checkbox")
                } icon: {
                    Image(systemName: task.isDone
                          ? "checkmark.square.fill"
                          : "square")
                }
                .labelStyle(.iconOnly)

            }

        }
        
    }
}

#Preview {
    TaskView(
        task: TaskModel(
            title: "Teste",
            date: Date(),
            isDone: false
        )
    )
}

extension View {
    func getDate(_ task: TaskModel) -> String {
        return task.date.formatted(.dateTime.day(.twoDigits).month(.twoDigits).year())
    }
    
    func getHour(_ task: TaskModel) -> String {
        return task.date.formatted(.dateTime.hour(.twoDigits(amPM: .omitted)).minute(.twoDigits))
    }
}
