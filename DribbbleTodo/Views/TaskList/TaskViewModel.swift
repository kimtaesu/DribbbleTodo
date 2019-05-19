//
//  TaskViewModel.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import RxDataSources

struct TaskViewModel: Equatable {
    let id: String
    var title: String
    let isDone: Bool
    let createdAt: Date
    
    static func empty() -> TaskViewModel {
        return TaskViewModel(id: UUID().uuidString, title: "", isDone: false, createdAt: Date())
    }
}

extension TaskViewModel: IdentifiableType {
    var identity: String {
        return id
    }
}

extension Task {
    var viewModel: TaskViewModel {
        return TaskViewModel(
            id: self.id,
            title: self.title,
            isDone: self.isDone,
            createdAt: self.createdAt
        )
    }
}

extension TaskViewModel {
    var editingTask: EditingTask {
        return EditingTask(title: self.title, id: self.id, createdAt: self.createdAt)
    }
}
