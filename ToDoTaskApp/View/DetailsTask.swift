//
//  DetailsTask.swift
//  ToDoTaskApp
//
//  Created by Beatriz Leonel on 18/03/25.
//

import SwiftUI

struct DetailsTask: View {
    var item: TaskModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Título: ")
                    .fontWeight(.bold)
                Text(item.title)
            }
            
            HStack {
                Image(systemName: "calendar")
                Text("Data")
                Text(getDate(item))
            }
            
            HStack {
                Image(systemName: "clock")
                Text("Hora")
                Text(getHour(item))
            }
            
            HStack {
                Image(systemName: item.isDone ?  "checkmark.square" : "square")
                Text(item.isDone ? "Concluído" : "Pendente")
            }
        }
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.inline)
        .frame(alignment: .topLeading)
        .padding(20)
    }
}

#Preview {
    DetailsTask(item: TaskModel(title: "Teste", date: Date(), isDone: false))
}
