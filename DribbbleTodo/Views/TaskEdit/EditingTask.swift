//
//  EditTask.swift
//  DribbbleTodo
//
//  Created by tskim on 19/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation

struct EditingTask {
    var id: String
    var title: String
    var createdAt: Date
    
    public init(title: String = "", id: String = UUID().uuidString, createdAt: Date = Date()) {
        self.id = id
        self.title = title
        self.createdAt = createdAt
    }
}

extension EditingTask {
    var task: Task {
        return Task().then {
            $0.id = self.id
            $0.title = self.title
            $0.createdAt = self.createdAt
        }
    }
}
