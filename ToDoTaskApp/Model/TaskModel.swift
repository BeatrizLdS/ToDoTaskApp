//
//  TaskModel.swift
//  ToDoTaskApp
//
//  Created by Beatriz Leonel on 12/03/25.
//

import Foundation
import Observation

import SwiftData

@Model
class TaskModel {
    var title: String
    var date: Date
    var isDone: Bool
    
    init(title: String, date: Date, isDone: Bool = false) {
        self.title = title
        self.date = date
        self.isDone = isDone
    }
}
