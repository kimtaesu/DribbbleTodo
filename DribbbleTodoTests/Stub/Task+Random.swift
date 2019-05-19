//
//  Task+Random.swift
//  DribbbleTodoTests
//
//  Created by tskim on 05/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
@testable import DribbbleTodo

extension Task {
    class func random(_ date: Date = Date()) -> Task {
        return Task().then {
            $0.title = randomText(length: 5)
            $0.createdAt = date
        }
    }
}

extension EditingTask {
    static func random() -> EditingTask {
        var editing = EditingTask()
        editing.title = randomText(length: 5)
        return editing
    }
}
