//
//  ToDoTaskAppApp.swift
//  ToDoTaskApp
//
//  Created by Beatriz Leonel on 12/03/25.
//

import SwiftUI
import SwiftData

@main
struct ToDoTaskAppApp: App {
    var body: some Scene {
        WindowGroup {
            ListTaskView()
        }
        .modelContainer(for: [TaskModel.self])
    }
}
